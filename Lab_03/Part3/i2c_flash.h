/***********************************************************
 * File: i2c_flash.h
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 3 - 2
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
#include <linux/semaphore.h>	//semaphores yeeeeeeeeeeeeeee
#include <linux/delay.h>


#define DEVICE_NAME		"i2c_flash"
#define SLAVE_ADDRE		0x52
#define ADAPT_NUMBR		2
#define PAGE_BYTES		64
#define NUM_OF_PAG		512

//global variables
int currPage;
unsigned int token_id;
struct semaphore *sem;		//mutual exclusion semaphore

/*
struct i2c_flash_dev {
	struct cdev cdev;	//the cdev structure
	char name[20];		//name of the device
} *i2c_flash_devp;
*/

struct queue_flash_dev {
	struct cdev cdev;	//the cdev structure
	char name[20];		//name of the device
} *queue_flash_devp;

//queue structures
struct queue_token
{
	int id;				//token id
	char *buf;			//character string
	unsigned int type;		//read or write
	struct queue_token *next;		//next in the list
};

struct queue_list {
	
	spinlock_t *lock;
	struct queue_token *token;
	struct queue_token *head;
	struct queue_token *curr;

} *token_list;

//i2c prototypes functs
static int queue_flash_open(struct inode *, struct file *);
static int i2c_flash_open(struct inode *, struct file *);

static ssize_t i2c_flash_read(struct file *, char __user *, size_t, loff_t *);
static ssize_t queue_flash_read(struct file *, char __user *, size_t, loff_t *);

static ssize_t i2c_flash_write(struct file *, const char __user *, size_t, loff_t *);
static ssize_t queue_flash_write(struct file *, const char __user *, size_t, loff_t *);

static int i2c_flash_release(struct inode *, struct file *);
static int queue_flash_release(struct inode *, struct file *);

static loff_t i2c_flash_lseek(struct file *, loff_t, int);
static loff_t queue_flash_lseek(struct file *, loff_t, int);
void set_offset(int);

//queue prototype functs
int create_list(struct queue_token *);

//prototpes mod init/exit
static int __init i2c_flash_dev_init(void);
static void __exit i2c_flash_dev_exit(void);

//struct class *i2c_flash_dev_class;      /* Tie with the device model */
//static dev_t i2c_flash_dev_number;      /* Allotted device number */
struct class *queue_flash_dev_class;
static dev_t queue_flash_dev_number;

/* File operations structure. Defined in linux/fs.h */
static struct file_operations queue_fops = {
    	.owner = THIS_MODULE,           	/* Owner */
    	.open = queue_flash_open,             /* Open method */
	.release = queue_flash_release,
	.llseek = queue_flash_lseek,
	.read = queue_flash_read,
	.write = queue_flash_write,
};

/*
static struct file_operations i2c_fops = {
	.owner = THIS_MODULE,
};
*/


module_init(i2c_flash_dev_init);
module_exit(i2c_flash_dev_exit);
MODULE_LICENSE("GPL v2");

#endif 
