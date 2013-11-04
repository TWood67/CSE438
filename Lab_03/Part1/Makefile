#obj-m:= main.o


KDIR:= ~/kernel
PWD:= $(shell pwd)

APP = main

default:
	arm-angstrom-linux-gnueabi-gcc -g main_03.c -o $(APP) -lpthread
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

clean:
	rm -f *.ko
	rm -f *.o
	rm -f Module.symvers
	rm -f modules.order
	rm -f *.mod.c
	rm -rf .tmp_versions
	rm -f *.mod.c
	rm -f *.mod.o
	rm -f \.*.cmd
	rm -f Module.markers
	rm -f $(APP)
