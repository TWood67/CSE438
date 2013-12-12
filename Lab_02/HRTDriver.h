/***********************************************************
 * File: HRTDriver.h
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 2
 ***********************************************************/
#ifndef HRTDRIVER_H
#define HRTDRIVER_H

//Headers
#include <linux/module.h>
#include <linux/kernel.h>	// printk();
#include <linux/fs.h>		// everything
#include <linux/cdev.h>
#include <linux/types.h>	// size_t
#include <linux/slab.h>		// kmalloc();
#include <asm/uaccess.h>	// copy_from/to_user();
#include <linux/pci.h>
#include <plat/dmtimer.h>		//dmtimer 
#include <linux/spinlock.h>
#include <linux/version.h>	//preprocessor conditional statements

//define
#define DEVICE_NAME	"HRTDriver"

//Struct
struct HRT_dev {
	struct cdev cdev;       /* The cdev structure */
	char name[20];          /* Name of device*/
	struct omap_dm_timer* gptimer;
} *hrt_devp;

//Globals
static dev_t my_dev_number;      /* Allotted device number */
struct class *my_dev_class;      /* Tie with the device model */

//Prototypes
int HRTDriver_open(struct inode *, struct file *);
int HRTDriver_release(struct inode *, struct file *);
unsigned int HRTDriver_read_timer(struct file *, unsigned int *, size_t count);
ssize_t HRTDriver_dmtimer_ioctl(struct file *, unsigned int, unsigned int);
struct omap_dm_timer *HRTDriver_reserve_timer(void);
void HRTDriver_release_timer(struct omap_dm_timer *);
unsigned int HRTDriver_get_timer_value(void);
int __init My_driver_init(void);
void __exit My_driver_exit(void);

EXPORT_SYMBOL(HRTDriver_read_timer);
EXPORT_SYMBOL(HRTDriver_dmtimer_ioctl);
EXPORT_SYMBOL(HRTDriver_get_timer_value);

#endif
