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
	{ 0xe80fc042, "module_layout" },
	{ 0xfa2a45e, "__memzero" },
	{ 0xfbc74f64, "__copy_from_user" },
	{ 0x97255bdf, "strlen" },
	{ 0x7d11c268, "jiffies" },
	{ 0x1a9df6cc, "malloc_sizes" },
	{ 0x3c2c5af5, "sprintf" },
	{ 0x9efa8d62, "device_create" },
	{ 0x33494c8a, "cdev_add" },
	{ 0x41d209eb, "cdev_init" },
	{ 0xe914e41e, "strcpy" },
	{ 0xbb4f6c53, "kmem_cache_alloc" },
	{ 0x77deeac7, "__class_create" },
	{ 0x29537c9e, "alloc_chrdev_region" },
	{ 0xefd6cf06, "__aeabi_unwind_cpp_pr0" },
	{ 0x27e1a049, "printk" },
	{ 0x230c085e, "class_destroy" },
	{ 0x37a0cba, "kfree" },
	{ 0x92f7004c, "cdev_del" },
	{ 0x4dd92d69, "device_destroy" },
	{ 0x7485e15e, "unregister_chrdev_region" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "1EE5B19A8FEE6C3AC7CC9D8");
