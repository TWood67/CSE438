/***********************************************************
 * File: i2c_flash.h
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 3 - 3
 ***********************************************************/
#ifndef I2C_FLASH_H
#define I2C_FLASH_H

//Headers
#include <linux/module.h>
#include <linux/kernel.h>	// printk();
#include <linux/fs.h>		// everything
#include <linux/cdev.h>
#include <linux/types.h>	// size_t
#include <linux/slab.h>		// kmalloc();
#include <asm/uaccess.h>	// copy_from/to_user();
#include <linux/pci.h>
#include <linux/version.h>	//preprocessor conditional statements
#include <linux/i2c.h>
#include <linux/delay.h>

#include <linux/workqueue.h>	//for work queues


#define DEVICE_NAME		"i2c_flash"
#define SLAVE_ADDRE		0x52
#define ADAPT_NUMBR		2
#define PAGE_BYTES		64
#define NUM_OF_PAG		512
#define WQUEUE_NAME		"i2c_flash_work_queue"

//global variables
int currPage;

int i2c_flash_eread, i2c_flash_ewrite;	//errors
int i2c_flash_page_count;	//page count

/*	QUEUE STATUS	  * 
 * 0x00 	Empty	  *
 * 0x01 	Busy	  *
 * 0x02 	Done	  *
 *			  */
int i2c_flash_queue_status;	//queue status

int i2c_flash_fread, i2c_flash_fwrite;	//tells whether read or write are finished
					// -1 is 
char *i2c_flash_rbuf, *i2c_flash_wbuf;	//buffers for read and write
struct i2c_client *client;
struct i2c_adapter *adap;
struct work_struct work_read;
struct work_struct work_write;

struct i2c_flash_wq {

	struct workqueue_struct *wq;	
	int size;

} *i2c_flash_wqp;

struct i2c_flash_dev {
	struct cdev cdev;	//the cdev structure
	char name[20];		//name of the device
} *i2c_flash_devp;

//prototypes fops
static int i2c_flash_open(struct inode *, struct file *);
static ssize_t i2c_flash_read(struct file *, char __user *, size_t, loff_t *);
static void __i2c_flash_read(void);
static ssize_t i2c_flash_write(struct file *, const char __user *, size_t, loff_t *);
static void __i2c_flash_write(void);
static int i2c_flash_release(struct inode *, struct file *);
loff_t i2c_flash_lseek(struct file *, loff_t, int);

//prototpes mod init/exit
static int __init i2c_flash_dev_init(void);
static void __exit i2c_flash_dev_exit(void);

//prototpes various funciton
void set_offset(int);

struct class *i2c_flash_dev_class;      /* Tie with the device model */
static dev_t i2c_flash_dev_number;      /* Allotted device number */


/* File operations structure. Defined in linux/fs.h */
static struct file_operations My_fops = {
    	.owner = THIS_MODULE,           	/* Owner */
    	.open = i2c_flash_open,             /* Open method */
	.release = i2c_flash_release,
	.llseek = i2c_flash_lseek,
	.read = i2c_flash_read,
	.write = i2c_flash_write,
};


module_init(i2c_flash_dev_init);
module_exit(i2c_flash_dev_exit);
MODULE_LICENSE("GPL v2");

#endif 
