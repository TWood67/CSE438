obj-m:= Mydriver.o


KDIR:= ~/kernel/kernel
PWD:= $(shell pwd)

APP = test_app

default:
	gcc main_01.c -o $(APP) -lpthread	
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
	rm -f *~
	rm -f *@*
	rm -f $(APP)
