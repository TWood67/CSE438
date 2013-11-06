#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x4a3dbd89, "module_layout" },
	{ 0x9d669763, "memcpy" },
	{ 0x69f910f8, "i2c_master_recv" },
	{ 0x67c2fa54, "__copy_to_user" },
	{ 0x33543801, "queue_work" },
	{ 0x12da5bb2, "__kmalloc" },
	{ 0x7edcd00, "i2c_master_send" },
	{ 0xfa2a45e, "__memzero" },
	{ 0xfbc74f64, "__copy_from_user" },
	{ 0xb81960ca, "snprintf" },
	{ 0x9de9c6e4, "i2c_get_adapter" },
	{ 0xe3cc56ec, "kmalloc_caches" },
	{ 0x43a53735, "__alloc_workqueue_key" },
	{ 0x4d2d1411, "device_create" },
	{ 0x504e95e7, "cdev_add" },
	{ 0x389150a0, "cdev_init" },
	{ 0xe914e41e, "strcpy" },
	{ 0x8dd2508a, "kmem_cache_alloc_trace" },
	{ 0xa22b0b52, "__class_create" },
	{ 0x29537c9e, "alloc_chrdev_region" },
	{ 0x92aa491a, "i2c_put_adapter" },
	{ 0xefd6cf06, "__aeabi_unwind_cpp_pr0" },
	{ 0x27e1a049, "printk" },
	{ 0x8c03d20c, "destroy_workqueue" },
	{ 0x42160169, "flush_workqueue" },
	{ 0x87d7889b, "class_destroy" },
	{ 0x37a0cba, "kfree" },
	{ 0xc7a88455, "cdev_del" },
	{ 0xac57d803, "device_destroy" },
	{ 0x7485e15e, "unregister_chrdev_region" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "D71F187E68618CA4F0D378D");
