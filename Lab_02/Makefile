obj-m:= HRTDriver.o Squeue.o


KDIR:= ~/kernel ~/kernel/arch/arm/plat-omap 
PWD:= $(shell pwd)

APP = HRTDriver_tester
APP2 = Squeue_tester
APP3 = main

default:
	arm-angstrom-linux-gnueabi-gcc -g HRTTester.c -o $(APP) -lpthread	
	arm-angstrom-linux-gnueabi-gcc -g Squeue_tester.c -o $(APP2) -lpthread	
	arm-angstrom-linux-gnueabi-gcc -g main_02.c -o $(APP3) -lpthread
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
