/***********************************************************
 * File: i2c_flash.c
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 3 - 3
 ***********************************************************/

#include "i2c_flash.h"

/* Add to list
 * Adds an item to the queue
 * TESTED
 */
int add_to_list(struct queue_token *tok) {

	int res = 0;

	//spin lock
	spin_lock(token_list->lock);

	//give the list an id
	tok->id = token_id;
	token_id++;
	
	//first we check to see if there is anything in the queue
	//we only need to check the head since the linked list 
	//will function as a FIFO queue. In other words, if there
	//is no head then there is nothing in the list
	//printk("\nPreparing to add to the list.\n\nThe list head is [%d]\n", head->id);
	printk("\nChecking for head\n");
	if (token_list->head == NULL) {
		//this will be the head node
		res = create_list(tok);
		spin_unlock(token_list->lock);
		return res;
	}

	//if the user passes an empty token
	if (tok == NULL) {
		spin_unlock(token_list->lock);
		return -1;
	}

	//queue the token
	tok->next = NULL;
	token_list->curr->next = tok;
	token_list->curr = tok;

	spin_unlock(token_list->lock);

	return res;
	
}

/* Create List 
 * Description: Creates the inital list
 * TESTED
 */
int create_list(struct queue_token *tok) {

	//if the node was improperly created
	if (tok == NULL) {
		printk("\n Node creation failed.\n");
		return -1;
	}
	tok->next = NULL;

	//global variables in the header
	token_list->head = token_list->curr = tok;

	printk("\nHead was created with an ID [%d].\n", token_list->head->id);
	return 0;
}

static int queue_flash_open(struct inode *inode, struct file *file) {		

	return i2c_flash_open(inode, file);

}

static int i2c_flash_open(struct inode *inode, struct file *file)
{
	struct i2c_client *client;
	struct i2c_adapter *adap;

	adap = i2c_get_adapter(ADAPT_NUMBR);
	if (!adap)
		return -ENODEV;

	/* This creates an anonymous i2c_client, which may later be
	 * pointed to some address using I2C_SLAVE or I2C_SLAVE_FORCE.
	 *
	 * This client is ** NEVER REGISTERED ** with the driver model
	 * or I2C core code!!  It just holds private copies of addressing
	 * information and maybe a PEC flag.
	 */
	client = kzalloc(sizeof(*client), GFP_KERNEL);
	if (!client) {
		i2c_put_adapter(adap);
		return -ENOMEM;
	}
	snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);

	client->adapter = adap;
	//set the slave addr

	client->addr = SLAVE_ADDRE;
	file->private_data = client;

	printk("\n%s opening\n", DEVICE_NAME);

	return 0;
}

static int queue_flash_release(struct inode *inode, struct file *file) {

	return i2c_flash_release(inode, file);

}

static int i2c_flash_release(struct inode *inode, struct file *file)
{
	struct i2c_client *client = file->private_data;

	i2c_put_adapter(client->adapter);
	kfree(client);
	file->private_data = NULL;

	return 0;
}

//TODO modify for queue
static ssize_t queue_flash_read(struct file *file, char __user *buf, size_t count, loff_t *offset) {

	//create a token and add it to the queue
	struct queue_token *tok = kmalloc(sizeof(struct queue_token), GFP_KERNEL);

	tok->buf = kmalloc(PAGE_BYTES * count, GFP_KERNEL);
	tok->type = 0;	//0 is read
	
	if (add_to_list(tok) < 0) return -1;
	
	return i2c_flash_read(file, buf, count, offset);

}

//TODO modify for queue
static ssize_t i2c_flash_read(struct file *file, char __user *buf, size_t count, loff_t *offset)
{
	char *tmp = kmalloc(PAGE_BYTES * count, GFP_KERNEL);
	int ret = 0;
	int i = 0;
	int address;
	char *asBuf = kmalloc(2, GFP_KERNEL);

	struct i2c_client *client = file->private_data;

	if (tmp == NULL)
		return -ENOMEM;

	//acquire semaphore
	//if (down_interruptible(sem)) return -ERESTARTSYS;

	for (i = 0; i < count; i++) {

		//for testing semaphore lock
		//msleep(5000);

		//Addres Low
		address = (currPage & 0x00ff);
		memcpy((char *)asBuf + 1, &address, 1);

		//Address high
		address = (currPage & 0xff00) >> 8;
		memcpy((char *)asBuf, &address, 1);
		
		//set the page to the correct spot for a read
		//i2c_flash_lseek(file, currPage / PAGE_BYTES, 0);
		ret = i2c_master_send(client, asBuf, 2);
		if (ret < 0) {
			printk("\nSomething happened when setting the address for read!\n");
			return -1;
		}
		

		pr_debug("i2c-dev: i2c-%d reading %zu bytes.\n",
			iminor(file->f_path.dentry->d_inode), i * PAGE_BYTES);

		ret = i2c_master_recv(client, tmp + (i * PAGE_BYTES), PAGE_BYTES);

		set_offset((currPage / PAGE_BYTES) + 1);
	}

	ret = copy_to_user(buf, tmp, count * PAGE_BYTES) ? -EFAULT : ret;

	//release semaphore
	//up(sem);
	
	kfree(tmp);
	return ret;
}

//TODO modify for 
static ssize_t queue_flash_write(struct file *file, const char __user *buf, size_t count, loff_t *offset) {
	
	return i2c_flash_write(file, buf, count, offset);
	
}

static ssize_t i2c_flash_write(struct file *file, const char __user *buf, size_t count, loff_t *offset)
{
	int ret = 0;
	char *tmp = kmalloc(PAGE_BYTES + 2, GFP_KERNEL);
	int address;
	struct i2c_client *client = file->private_data;
	int i = 0;

	//acquire semaphore
	//if (down_interruptible(sem)) return -ERESTARTSYS;

	for (i = 0; i < count; i++) {
		
		//verify all the bits were copied
		if (copy_from_user(tmp + 2, buf + (i * PAGE_BYTES), PAGE_BYTES)) {
			kfree(tmp);
			printk("\nSomething happened when copying data from the user!\n");
		return -1;
		}
		if (IS_ERR(tmp))
			return PTR_ERR(tmp);

		pr_debug("i2c-dev: i2c-%d writing %zu bytes.\n",
			iminor(file->f_path.dentry->d_inode), count);

		//get the write address
		//Address high
		address = (currPage & 0xff00) >> 8;
		memcpy(tmp , &address, 1);

		//Address Low
		address = (currPage & 0x00ff);
		memcpy(tmp + 1, &address, 1);
		
		//write to EEPROM
		ret = i2c_master_send(client, tmp, PAGE_BYTES + 2);

		if (ret < 0) {
			//failure
			printk("\nSomething happened when writing!\n");
			kfree(tmp);
			return -1;
		}

		//increment the page offset
		set_offset((currPage / PAGE_BYTES) + 1);
	}

	//release semaphore
	//up(sem);

	kfree(tmp);
	return ret;
}

static loff_t queue_flash_lseek(struct file *file, loff_t offset, int whence) {
	
	return i2c_flash_lseek(file, offset, whence);

}

static loff_t i2c_flash_lseek(struct file *file, loff_t offset, int whence) {
	
	struct i2c_client *client = file->private_data;
	char *asBuf = kmalloc(2, GFP_KERNEL);
	int address;
	int res;

	//get the semaphore here, we don't want the offset
	//changed while something is trying to write
	//if (down_interruptible(sem)) return -ERESTARTSYS;
	set_offset(offset);

	//Addres Low
	address = (currPage & 0x00ff);
	memcpy((char *)asBuf + 1, &address, 1);

	//Address high
	address = (currPage & 0xff00) >> 8;
	memcpy((char *)asBuf, &address, 1);

	

	res = i2c_master_send(client, asBuf, 2);

	//up(sem);

	if (res < 0) {
		printk("\nWriting the address failed!\n");
		return -1;
	}

	kfree(asBuf);

	return res;
}

void set_offset(int offset) {
	
	currPage = offset * PAGE_BYTES;

	//increment the current page
	if (currPage < 0 || (currPage / PAGE_BYTES) > 511)
		currPage = 0x0000;
	printk("\nCurrent page [%d]\n", currPage / PAGE_BYTES);
}

static int __init i2c_flash_dev_init(void)
{
	int res;

	printk(KERN_INFO "i2c /dev entries driver\n");

	if (alloc_chrdev_region(&queue_flash_dev_number, 0, 1, DEVICE_NAME)) {
		printk(KERN_DEBUG "Can't registed device \"%s\"\n", DEVICE_NAME);
	}

	/* Bind to already existing adapters right away */
	//i2c_for_each_dev(NULL, i2cdev_attach_adapter);
	queue_flash_devp = kmalloc(sizeof(struct queue_flash_dev), GFP_KERNEL);

	if (!queue_flash_devp) {
		printk("Bad kmalloc on device \"%s\"\n", DEVICE_NAME);
		return -ENOMEM;
	}

	//request I/O region
	sprintf(queue_flash_devp->name, DEVICE_NAME);

	//connect fops with the cdev
	cdev_init(&queue_flash_devp->cdev, &queue_fops);
	queue_flash_devp->cdev.owner = THIS_MODULE;

	//connect the major/minor num to the cdev
	res = cdev_add(&queue_flash_devp->cdev, MKDEV(MAJOR(queue_flash_dev_number), 0), 1);

	if (res < 0) {
		printk("Bad cdev on device \"%s\"\n", DEVICE_NAME);
		return res;
	}

	//send uevents to udev to create /dev nodes
	queue_flash_dev_class = class_create(THIS_MODULE, DEVICE_NAME);
	device_create(queue_flash_dev_class, NULL, MKDEV(MAJOR(queue_flash_dev_number), 0), NULL, DEVICE_NAME);

	//instantiate current page to 0
	currPage = 0;
	token_id = 1;

	//allocate memory and initialize the semaphore
	//sem = kmalloc(sizeof(struct semaphore), GFP_KERNEL);
	//sema_init(sem, 1);

	printk("%s initialized.\n", DEVICE_NAME);

	return 0;

}

static void __exit i2c_flash_dev_exit(void)
{
	//Release major number
	unregister_chrdev_region((queue_flash_dev_number), 1);

	//Destroy device
	device_destroy(queue_flash_dev_class, MKDEV(MAJOR(queue_flash_dev_number), 0));

	if (queue_flash_devp) {
		cdev_del(&queue_flash_devp->cdev);
		kfree(queue_flash_devp);
	}

	//Destroy driver_class
	class_destroy(queue_flash_dev_class);

	//free the allocated space for the semaphore
	//kfree(sem);

	printk("%s removed.\n", DEVICE_NAME);

}
