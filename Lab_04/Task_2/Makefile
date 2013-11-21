obj-m:= HRTDriver.o Squeue.o


KDIR:= ~/kernel ~/kernel/arch/arm/plat-omap 
PWD:= $(shell pwd)

APP = Task2

default:
	arm-angstrom-linux-gnueabi-gcc -g main.c -o $(APP) -lpthread

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
	rm -f *~
	rm -f *@*
	rm -f $(APP)
