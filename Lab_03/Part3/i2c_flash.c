/***********************************************************
 * File: i2c_flash.c
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 3 - 3
 ***********************************************************/

#include "i2c_flash.h"


static int i2c_flash_open(struct inode *inode, struct file *file)
{
	adap = kmalloc(sizeof(struct i2c_adapter), GFP_KERNEL);
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
	//file->private_data = client;

	printk("\n%s opening\n", DEVICE_NAME);

	return 0;
}

static int i2c_flash_release(struct inode *inode, struct file *file)
{

	if (client->adapter) i2c_put_adapter(client->adapter);
	if (client) kfree(client);

	return 0;
}

static ssize_t i2c_flash_read(struct file *file, char __user *buf, size_t count, loff_t *offset)
{
	int ret;

	printk("\nEntering the read!\n");
	
	switch (i2c_flash_queue_status) {
		//Queue is empty
		case 0x00:
			i2c_flash_queue_status = 0x01;
			printk("\nThe Queue is empty!\n");
			i2c_flash_page_count = count;
			i2c_flash_rbuf = kmalloc(PAGE_BYTES * i2c_flash_page_count, GFP_KERNEL);
			memset(i2c_flash_rbuf, 0, PAGE_BYTES * i2c_flash_page_count);
			printk("\nGlobal variables have been set and preparing to queue the work!\n");
			//queue the work
			INIT_WORK(&work_read, (void *)__i2c_flash_read);
			ret =queue_work(i2c_flash_wqp->wq, &work_read);		
			printk("\nThe value of ret is [%d]\n", ret);	
			if (ret != 0) {	
				printk("\nWork has been queued and the status updated!\n");				
				return -2;
			}
			else
				return ret;
			break;
		//EEPROM is busy
		case 0x01:	
			printk("\nEEPROM is busy\n");
			return -1;
			break;
		//work is done reading from the EEPROM.
		//copy buffer to user space
		case 0x02:
			printk("\nCopying data to user!\n");
			ret = copy_to_user(buf, i2c_flash_rbuf, i2c_flash_page_count * PAGE_BYTES);
			goto exit;
			//if (ret != 0) return -3;	//error 3 indicates something went wrong
			break;
	}

exit: 
	printk("\nIn the read exit. Queue status is [%d]\n", i2c_flash_queue_status);
	i2c_flash_queue_status = 0x00;
	printk("\nIn the read exit. Queue status is now [%d]\n", i2c_flash_queue_status);
	//uninitialize all variables
	printk("\nFreeing the i2c_flash_rbuf\n");
	if (i2c_flash_rbuf) kfree(i2c_flash_rbuf);
	printk("\nDone freeing the i2c_flash_rbuf\n");
	i2c_flash_page_count = 0;

	return 0;
}

static void __i2c_flash_read(void) {

	int ret = 0;
	int i = 0;
	int address;
	char *asBuf = kmalloc(2, GFP_KERNEL);
	char *tbuf = kmalloc(i2c_flash_page_count * PAGE_BYTES, GFP_KERNEL);

	for (i = 0; i < i2c_flash_page_count; i++) {

		printk("\nEntering i2c_read\n");

		//Addres Low
		address = (currPage & 0x00ff);
		memcpy((char *)asBuf + 1, &address, 1);

		//Address high
		address = (currPage & 0xff00) >> 8;
		memcpy((char *)asBuf, &address, 1);
		
		//set the page to the correct spot for a read
		//i2c_flash_lseek(file, currPage / PAGE_BYTES, 0);
		printk("\nSending address to master on loop [%d]\n", i);
		ret = i2c_master_send(client, asBuf, 2);

		
		if (ret < 0) {
			printk("\nSomething happened when setting the address for read!\n");
			i2c_flash_eread = -1;
		}

		printk("\nReading on loop [%d]\n", i);
		ret = i2c_master_recv(client, tbuf + (i * PAGE_BYTES), PAGE_BYTES);

		set_offset((currPage / PAGE_BYTES) + 1);
	}

	printk("\nExiting read and copying memory\n");
	memcpy(i2c_flash_rbuf, tbuf, i2c_flash_page_count * PAGE_BYTES);

	if (tbuf) kfree(tbuf);
	if (asBuf) kfree(asBuf);
	

	i2c_flash_queue_status = 0x02;

}

static ssize_t i2c_flash_write(struct file *file, const char __user *buf, size_t count, loff_t *offset) {

	int ret;

	printk("\nEntering the write!\n");
	switch (i2c_flash_queue_status) {

		//Queue is empty
		case 0x00:
			i2c_flash_queue_status = 0x01;
			printk("\nThe page is empty!\n");
			i2c_flash_page_count = count;
			i2c_flash_wbuf = kmalloc(PAGE_BYTES * i2c_flash_page_count, GFP_KERNEL);
			ret = copy_from_user(i2c_flash_wbuf, buf, PAGE_BYTES * i2c_flash_page_count);
			printk("\nGlobal variables have been set!\n");
			//if (ret != 0) {
			//	return -3; //return something happened
			//}
			//allocate memory for the work
			//work_write = kmalloc(sizeof(struct work_struct), GFP_KERNEL);
			//queue the work	
			printk("\nInitializing work thread!\n");
			INIT_WORK(&work_write, (void *)__i2c_flash_write);
			printk("\nQueuing the work!\n");
			ret = queue_work(i2c_flash_wqp->wq, &work_write);
			printk("\nWork queued!\n");	
			if (ret != 0) {		
				printk("\nReturn -2\n");			
				return -2;
			}
			else {
				printk("\nReturning ret\n");
				return ret;
			}
			printk("\nBreaking\n");
			break;
		//EEPROM is busy
		case 0x01:	
			printk("\nEEPROM is busy!\n");
			return -1;
			break;
		//work is done writing to the EEPROM
		case 0x02:
			printk("\nDone working!\n");
			goto exit;
			break;
	}
exit:
	printk("\nIn the write exit. Queue status is [%d]\n", i2c_flash_queue_status);
	i2c_flash_queue_status = 0x00;
	printk("\nIn the write exit. Queue status is now [%d]\n", i2c_flash_queue_status);
	//uninitialize all variables
	if (i2c_flash_wbuf) kfree(i2c_flash_wbuf);
	i2c_flash_page_count = 0;

	return 0;
}

static void __i2c_flash_write(void)
{
	int ret;
	char *tmp = kmalloc(PAGE_BYTES + 2, GFP_KERNEL);
	int address;
	int i = 0;

	printk("\n__i2c_flash_write entered\n");
	for (i = 0; i < i2c_flash_page_count; i++) {
		
		//verify all the bits were copied
		printk("\nCopying buffer from user!\n");
		ret = copy_from_user(tmp + 2, i2c_flash_wbuf + (i * PAGE_BYTES), PAGE_BYTES);
		printk("\nDone copying buffer from user!\n");

		//get the write address
		//Address high
		address = (currPage & 0xff00) >> 8;
		memcpy(tmp , &address, 1);

		//Address Low
		address = (currPage & 0x00ff);
		memcpy(tmp + 1, &address, 1);
		
		//write to EEPROM
		printk("\nWriting to EEPROM.\n");
		ret = i2c_master_send(client, tmp, PAGE_BYTES + 2);
		printk("\nDone writing to EEPROM.\n");

		//increment the page offset
		set_offset((currPage / PAGE_BYTES) + 1);
	}

	printk("\nExiting write\n");
	if (tmp) kfree(tmp);
	
	i2c_flash_queue_status = 0x02;
}

loff_t i2c_flash_lseek(struct file *file, loff_t offset, int whence) {
	
	char *asBuf = kmalloc(2, GFP_KERNEL);
	int address;
	int res;

	set_offset(offset);

	//Addres Low
	address = (currPage & 0x00ff);
	memcpy((char *)asBuf + 1, &address, 1);

	//Address high
	address = (currPage & 0xff00) >> 8;
	memcpy((char *)asBuf, &address, 1);

	

	res = i2c_master_send(client, asBuf, 2);

	if (res < 0) {
		printk("\nWriting the address failed!\n");
		return -1;
	}

	if (asBuf) kfree(asBuf);

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

	//res = register_chrdev(I2C_MAJOR, "i2c", &i2cdev_fops);
	//if (res)
		//goto out;
	if (alloc_chrdev_region(&i2c_flash_dev_number, 0, 1, DEVICE_NAME)) {
		printk(KERN_DEBUG "Can't registed device \"%s\"\n", DEVICE_NAME);
	}

	i2c_flash_dev_class = class_create(THIS_MODULE, DEVICE_NAME);

	/* Bind to already existing adapters right away */
	//i2c_for_each_dev(NULL, i2cdev_attach_adapter);
	i2c_flash_devp = kmalloc(sizeof(struct i2c_flash_dev), GFP_KERNEL);

	if (!i2c_flash_devp) {
		printk("Bad kmalloc on device \"%s\"\n", DEVICE_NAME);
		return -ENOMEM;
	}

	//request I/O region
	sprintf(i2c_flash_devp->name, DEVICE_NAME);

	//connect fops with the cdev
	cdev_init(&i2c_flash_devp->cdev, &My_fops);
	i2c_flash_devp->cdev.owner = THIS_MODULE;

	//connect the major/minor num to the cdev
	res = cdev_add(&i2c_flash_devp->cdev, MKDEV(MAJOR(i2c_flash_dev_number), 0), 1);

	if (res < 0) {
		printk("Bad cdev on device \"%s\"\n", DEVICE_NAME);
		return res;
	}

	//send uevents to udev to create /dev nodes
	device_create(i2c_flash_dev_class, NULL, MKDEV(MAJOR(i2c_flash_dev_number), 0), NULL, DEVICE_NAME);

	//instantiate current page to 0
	currPage = 0;

	//need to initialize the work queue
	i2c_flash_wqp = kmalloc(sizeof(struct i2c_flash_wq), GFP_KERNEL);
	i2c_flash_wqp->wq = create_singlethread_workqueue(WQUEUE_NAME);
	i2c_flash_wqp->size = 0;

	i2c_flash_queue_status = 0;
	i2c_flash_page_count = 0;

	i2c_flash_rbuf = NULL;
	i2c_flash_wbuf = NULL;	//buffers for read and write
	client = NULL;
	adap = NULL;

	printk("\nInitializing work_write!\n");
	INIT_WORK(&work_write, NULL);
	printk("\nInitializing work_read!\n");
	INIT_WORK(&work_read, NULL);

	printk("%s initialized.\n", DEVICE_NAME);

	return 0;

}

static void __exit i2c_flash_dev_exit(void)
{
	//Release major number
	unregister_chrdev_region((i2c_flash_dev_number), 1);

	//Destroy device
	device_destroy(i2c_flash_dev_class, MKDEV(MAJOR(i2c_flash_dev_number), 0));

	if (i2c_flash_devp) {
		cdev_del(&i2c_flash_devp->cdev);
		kfree(i2c_flash_devp);
	}

	//Destroy driver_class
	class_destroy(i2c_flash_dev_class);

	//flush the workqueue and destroy the queue
	flush_workqueue(i2c_flash_wqp->wq);
	destroy_workqueue(i2c_flash_wqp->wq);
	kfree(i2c_flash_wqp);

	printk("%s removed.\n", DEVICE_NAME);

}
