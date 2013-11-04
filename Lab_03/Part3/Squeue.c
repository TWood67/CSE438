/***********************************************************
 * File: Squeue.h
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 2
 ***********************************************************/

#include "Squeue.h"

/* File operations structure. Defined in linux/fs.h */
static struct file_operations My_fops = {
    	.owner = THIS_MODULE,           	/* Owner */
    	.open = Squeue_open,             /* Open method */
	.read = delete_from_list,
	.release = Squeue_release,
	.write = add_to_list,
};

/* 
 * Open Squeue driver
 */
int Squeue_open(struct inode *inode, struct file *file)
{
	/* Get the per-device structure that contains this cdev */
	squeue_devp = container_of(inode->i_cdev, struct Squeue_dev, cdev);
	printk("\nopening\n");

	/* Easy access to cmos_devp from rest of the entry points */
	file->private_data = squeue_devp;

	printk("\n%s is opening\n", squeue_devp->name);

	return 0;
}

/*
 * Release Squeue driver
 */
int Squeue_release(struct inode *inode, struct file *file)
{
	struct Squeue_dev *squeue_devp = file->private_data;

	//reset token id
	token_id = 1;
	
	printk("\n%s is closing\n", squeue_devp->name);
	
	return 0;
}

/* Create List 
 * Description: Creates the inital list
 * TESTED
 */
int create_list(struct file *file, struct token *list) {

	//if the node was improperly created
	if (list == NULL) {
		printk("\n Node creation failed.\n");
		return -1;
	}
	list->next = NULL;

	//global variables in the header
	squeue_devp->head = squeue_devp->curr = list;
	printk("\nHead was created with an ID [%d].\n", squeue_devp->head->id);
	return 0;
}

/* Add to list
 * Adds an item to the queue
 * TESTED
 * TODO take a user created token and build the list from that
 * User passes a pointer to a struct to driver
 * Driver copies from the user buffer using copy_from_user()
 * Driver typecast the pointer to a pointer to the struct
 */
int add_to_list(struct file *file, struct token *user_token, size_t count, loff_t *off) {

	//allocate memory in the kernel space
	struct token *list = (struct token*)kmalloc(sizeof(struct token), GFP_KERNEL);
	int res;

	//spin lock
	spin_lock(squeue_devp->lock);
	
	//if the queue is full then -1 is returned
	if (squeue_devp->size == QUEUE_SIZE) {
		spin_unlock(squeue_devp->lock);
		return -1;
	} 	

	//copy from the user the struct.
	//this will go to the driver
	res = copy_from_user((void *)list, (void __user *)user_token, count);

	//give the list an id
	list->id = token_id;
	list->ts_write = HRTDriver_get_timer_value();
	token_id++;

	sprintf(list->in_string, "All your base are belong to us!");
	
	//first we check to see if there is anything in the queue
	//we only need to check the head since the linked list 
	//will function as a FIFO queue. In other words, if there
	//is no head then there is nothing in the list
	//printk("\nPreparing to add to the list.\n\nThe list head is [%d]\n", head->id);
	printk("\nChecking for head\n");
	if (squeue_devp->head == NULL) {
		//this will be the head node
		res = create_list(file, list);
		spin_unlock(squeue_devp->lock);
		return res;
	}

	//if the user passes an empty token
	if (list == NULL) {
		spin_unlock(squeue_devp->lock);
		return -1;
	}

	//print_list(file,NULL,0, NULL);

	//queue the token
	list->next = NULL;
	squeue_devp->curr->next = list;
	squeue_devp->curr = list;

	spin_unlock(squeue_devp->lock);

	return res;
	
}

/* Delete From List
 * Deletes the head node from the list
 * UNTESTED
 * TODO return the token to user space
 */
int delete_from_list(struct file *file, struct token *user_token, size_t count, loff_t *off) {

	int res;
	
	//struct token *prev = NULL;
	struct token *del = NULL;

	//if there is nothing in the
	//queue return -1
	if (squeue_devp->head == NULL) return -1;
	
	//we want to delete the head
	del = squeue_devp->head;

	//point the head to the next location
	printk("\nThe new head is [%d]\n", squeue_devp->head->id);

	squeue_devp->head = del->next;
	squeue_devp->size--;

	res = copy_to_user((void __user *)user_token, (void *)del, sizeof(struct token));
	kfree(del);
	del = NULL;

	return 0;
}

int __init Queue_driver_init(void) {
	int ret;

	/* Request dynamic allocation of a device major number */
	/*
	int alloc_chrdev_region (dev_t *  dev, //output parameter
 	unsigned  	baseminor, //first of the requested minor range
 	unsigned  	count, //number of minors required
 	const char *  	name); //name of device drive
	*/
	//allocate the first device
	if (alloc_chrdev_region(&squeue_dev_number, 0, 1, DEVICE_NAME) < 0) {
			printk(KERN_DEBUG "Can't register device \"%s\"\n", DEVICE_NAME); return -1;
	}
	
	/* Populate sysfs entries */
	squeue_dev_class = class_create(THIS_MODULE, DEVICE_NAME);
	
	/* Allocate memory for the per-device structure */
	squeue_devp = kmalloc(sizeof(struct Squeue_dev), GFP_KERNEL);

	squeue_devp->lock = kmalloc(sizeof(spinlock_t), GFP_KERNEL);
		
	if (!squeue_devp) {
		printk("Bad Kmalloc on device \"%s\"\n", DEVICE_NAME); return -ENOMEM;
	}
	
	/* Request I/O region */
	sprintf(squeue_devp->name, DEVICE_NAME);

	/* Connect the file operations with the cdev */
	cdev_init(&squeue_devp->cdev, &My_fops);
	squeue_devp->cdev.owner = THIS_MODULE;

	
	/* Connect the major/minor number to the cdev */
	ret = cdev_add(&squeue_devp->cdev, MKDEV(MAJOR(squeue_dev_number), 0), 1);

	if (ret) {
		printk("Bad cdev on device \"%s\"\n", DEVICE_NAME);
		return ret;
	}

	/* Send uevents to udev, so it'll create /dev nodes */
	device_create(squeue_dev_class, NULL, MKDEV(MAJOR(squeue_dev_number), 0), NULL, DEVICE_NAME);

	//initialize values in the device pointers
	squeue_devp->size = 0;
	
	spin_lock_init(squeue_devp->lock);

	squeue_devp->token = NULL;

	squeue_devp->head = NULL;

	squeue_devp->curr = NULL;
	

	printk("%s Initialized.\n", DEVICE_NAME);
	
	return 0;
}

/* Driver Exit */
void __exit Queue_driver_exit(void)
{
	/* Release the major number */
	unregister_chrdev_region((squeue_dev_number), 1);

	/* Destroy device */
	device_destroy (squeue_dev_class, MKDEV(MAJOR(squeue_dev_number), 0));
	cdev_del(&squeue_devp->cdev);
	kfree(squeue_devp);
	
	/* Destroy driver_class */
	class_destroy(squeue_dev_class);	

	printk("%s removed.\n", DEVICE_NAME);
}

module_init(Queue_driver_init);
module_exit(Queue_driver_exit);
MODULE_LICENSE("GPL v2");
