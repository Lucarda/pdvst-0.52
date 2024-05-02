# Compile with MinGW.
# You can call this makefile with:
#	make PDDIR=<path/to/pd>
# or you can specify it below:

PDDIR=../build/Release64/.pd/

WINARCH := $(shell $(CC) -dumpmachine)

ifneq (,$(findstring i686,$(WINARCH)))
	arch = 32
else
	arch = 64
endif

ALL: vstschedlib.c
	gcc -Wall -I$(PDDIR)src -I../vst-template vstschedlib.c -static-libgcc \
	-shared -L$(PDDIR)bin -l:pd.dll -o vstschedlib.dll
	strip vstschedlib.dll
	#cp vstschedlib.dll ../build/pd-scheduler$(arch)/vstschedlib.dll
	#cp vstschedlib.dll ../build/Release$(arch)/.pd/bin/vstschedlib.dll
	cp vstschedlib.dll ../build/Release$(arch)/vstschedlib.dll