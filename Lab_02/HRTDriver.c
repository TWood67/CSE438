/***********************************************************
 * File: HRTDriver.c
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 2
 ***********************************************************/
#include "HRTDriver.h"

/* File operations structure. Defined in linux/fs.h */
static struct file_operations My_fops = {
    	.owner = THIS_MODULE,           	/* Owner */
    	.open = HRTDriver_open,             /* Open method */
	.read = HRTDriver_get_timer_value,
	.release = HRTDriver_release,
 	#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,35)) 
		.ioctl = HRTDriver_dmtimer_ioctl, 
	#else 
		.unlocked_ioctl = HRTDriver_dmtimer_ioctl, 
	#endif 
};

/*
 * Open HRT Driver
 * initialize timer
 */
int HRTDriver_open(struct inode *inode, struct file *file)
{
	struct HRT_dev *hrt_devp;
	
	printk("\nopening\n");

	/* Get the per-device structure that contains this cdev */
	hrt_devp = container_of(inode->i_cdev, struct HRT_dev, cdev);

	/* Easy access to cmos_devp from rest of the entry points */
	file->private_data = hrt_devp;

	printk("\n%s is openning\n", hrt_devp->name);

	return 0;
}

/*
 * Release HRT Driver
 */
int HRTDriver_release(struct inode *inode, struct file *file)
{
	struct HRT_dev *hrt_devp = file->private_data;
	
	printk("\n%s is closing\n", hrt_devp->name);
	
	return 0;
}

/*
 * Read from the timer
 * For user space
 * TESTED
 * Returns the value in the timer
 * TODO: change the return
 */
unsigned int HRTDriver_read_timer(struct file *file, unsigned int *buffer, size_t count) {
	
	unsigned int time;
	int res;	

	time = omap_dm_timer_read_counter(hrt_devp->gptimer);

	res = copy_to_user((void __user *)buffer, (void *)time, 32);

	return res;

}
/*
 * Get timer value
 * For kernel space
 * Returns the value in the timer
 */
unsigned int HRTDriver_get_timer_value(void) {
	return omap_dm_timer_read_counter(hrt_devp->gptimer);
}


/*
 * IOCTL commands
 * TESTED
 * PARAMETERS:
 * cmd - 0xffc1 start, 0xffc2 stop, 0xffc3 set
 * arg - value to write to timer
 */
ssize_t HRTDriver_dmtimer_ioctl(struct file *file, unsigned int cmd, unsigned int arg) {

	printk("IOCTL entered\n\n");

	switch(cmd) {
		case 0xffc1: 
			printk("\nStarting the timer.\n");
			omap_dm_timer_start(hrt_devp->gptimer);
			return 0;
		case 0xffc2:
			printk("\nStopping the timer.\n\n");
			omap_dm_timer_stop(hrt_devp->gptimer);
			return 0;
		case 0xffc3:
			printk("\nSetting the timer\n\n");
			omap_dm_timer_write_counter(hrt_devp->gptimer, arg);
			return 0;
		default:
			return -1;

	}
	/*
	//start command
	if (!strcmp(cmd, "0xffc1")) {
		printk("\nStarting the timer.\n");
		omap_dm_timer_start(hrt_devp->gptimer);
		return 0;
	}
	else if (!strcmp(cmd, "0xffc2")) {
		printk("\nStopping the timer.\n\n");
		omap_dm_timer_stop(hrt_devp->gptimer);
		return 0;
	}
	else if (!strcmp(cmd, "0xffc3")) {
		printk("\nSetting the timer\n\n");
		omap_dm_timer_write_counter(hrt_devp->gptimer, arg);
		return 0;
	}
	else return -1;
	*/

}

/*
 * Request dmtimer
 * TESTED
 */
struct omap_dm_timer *HRTDriver_reserve_timer(void) {

	//Get device private data
	//struct HRT_dev *hrt_devp = file->private_data;
	struct omap_dm_timer *timer;
	
	timer = omap_dm_timer_request();

	omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_SYS_CLK);
	omap_dm_timer_enable(timer);

	if (!timer) printk("\nTimer not reserved!\n");
	else printk("\nTimer succesfully reserved!\n");
	
	//setting the load enables the timer
	//omap_dm_timer_set_load_start(hrt_devp->gptimer, 0, 0);
	omap_dm_timer_start(timer);

	return timer;

}

/*
 * Release dmtimer
 * TESTED
 */
void HRTDriver_release_timer(struct omap_dm_timer *timer) {

	omap_dm_timer_disable(timer);
	omap_dm_timer_free(timer);

}

/*
 * Driver Initialization
 */
int __init My_driver_init(void)
{
	int ret;

	/* Request dynamic allocation of a device major number */
	/*
	int alloc_chrdev_region (dev_t *  dev, //output parameter
 	unsigned  	baseminor, //first of the requested minor range
 	unsigned  	count, //number of minors required
 	const char *  	name); //name of device drive
	*/
	if (alloc_chrdev_region(&my_dev_number, 0, 1, DEVICE_NAME) < 0) {
			printk(KERN_DEBUG "Can't register device\n"); return -1;
	}

	/* Populate sysfs entries */
	my_dev_class = class_create(THIS_MODULE, DEVICE_NAME);

	
	/* Allocate memory for the per-device structure */
	hrt_devp = kmalloc(sizeof(struct HRT_dev), GFP_KERNEL);
		
	if (!hrt_devp) {
		printk("Bad Kmalloc\n"); return -ENOMEM;
	}

	/* Request I/O region */
	sprintf(hrt_devp->name, DEVICE_NAME);


	/* Connect the file operations with the cdev */
	cdev_init(&hrt_devp->cdev, &My_fops);
	hrt_devp->cdev.owner = THIS_MODULE;

	/* Connect the major/minor number to the cdev */
	ret = cdev_add(&hrt_devp->cdev, (my_dev_number), 1);

	if (ret) {
		printk("Bad cdev\n");
		return ret;
	}

	/* Send uevents to udev, so it'll create /dev nodes */
	device_create(my_dev_class, NULL, MKDEV(MAJOR(my_dev_number), 0), NULL, DEVICE_NAME);		
	

	printk("%s Initialized.\n", DEVICE_NAME);
	
	//initialize the timer
	printk("Initializing timer.\n");
	hrt_devp->gptimer = HRTDriver_reserve_timer();
	if (!hrt_devp->gptimer) {
		printk("Something bad happened when reserving the timer!\n");
		return -1;
	}
	printk("Timer initialized.\n");

	return 0;
}

/* Driver Exit */
void __exit My_driver_exit(void)
{
	/* Release the major number */
	unregister_chrdev_region((my_dev_number), 1);

	//destroy the timer
	HRTDriver_release_timer(hrt_devp->gptimer);

	/* Destroy device */
	device_destroy (my_dev_class, MKDEV(MAJOR(my_dev_number), 0));
	cdev_del(&hrt_devp->cdev);
	kfree(hrt_devp);
	
	/* Destroy driver_class */
	class_destroy(my_dev_class);

	printk("%s removed.\n", DEVICE_NAME);
}

module_init(My_driver_init);
module_exit(My_driver_exit);
MODULE_LICENSE("GPL v2");
