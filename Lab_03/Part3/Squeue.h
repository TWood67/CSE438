/***********************************************************
 * File: Squeue.h
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 2
 ***********************************************************/
#ifndef SQUEUE_H
#define SQUEUE_H

//Headers
#include <linux/module.h>
#include <linux/kernel.h>	// printk();
#include <linux/fs.h>		// everything
#include <linux/cdev.h>
#include <linux/types.h>	// size_t
#include <linux/slab.h>		// kmalloc();
#include <asm/uaccess.h>	// copy_from/to_user();
#include <linux/pci.h>
#include <plat/dmtimer.h>	//dmtimer 
#include <linux/spinlock.h>
#include <linux/version.h>	//preprocessor conditional statements

//defines
#define DEVICE_NAME		"Squeue"
#define QUEUE_SIZE		10

//structures
struct token
{
	int id;				//token id
	char in_string[80];		//character string
	struct token *next;		//next in the list
};

struct Squeue_dev {
	struct cdev cdev;	//the cdev structure
	char name[20];		//name of the device
	spinlock_t *lock;	//Thread protection
	int size;		//the size of the queue
	struct token *token;	//token devices
	struct token *head;
	struct token *curr;
} *squeue_devp;

//
static dev_t squeue_dev_number;      /* Allotted device number */
struct class *squeue_dev_class;      /* Tie with the device model */
struct file *fd;
unsigned int token_id = 1;

//prototypes
int Squeue_open(struct inode *, struct file *);
int create_list(struct file *file, struct token *);
int add_to_list(struct file *,struct token *, size_t, loff_t *);
struct token* search_in_list(int, struct token **);
int delete_from_list(struct file *file, struct token *, size_t , loff_t *);
void print_list(struct file *, const char *, size_t, loff_t *);
int Squeue_release(struct inode *, struct file *);
int __init Queue_driver_init(void);
void __exit Queue_driver_exit(void);

//globals


#endif
