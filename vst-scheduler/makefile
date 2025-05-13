# Compile with MinGW.
# You can call this makefile with:
#   make PDDIR=<path/to/pd>
# or you can specify it below:

PDDIR="C:/Program Files/Pd"

SOURCES= \
    vstschedlib.c \
    cross-helper.c \
    $(empty)

# Let (native or cross-) compiler report target triplet and isolate individual
# words therein to facilitate later processing.
target.triplet := $(subst -, ,$(shell $(CC) -dumpmachine))

#=== operating system ==========================================================


# The following systems are defined: Linux, Darwin, Windows. GNU and
# GNU/kFreeBSD are treated as Linux to get the same options.

ifneq ($(filter linux gnu% kfreebsd, $(target.triplet)),)
    system = Linux
    all: linux-build
endif

ifneq ($(filter darwin%, $(target.triplet)),)
    system = Darwin
endif

ifneq ($(filter mingw% cygwin%, $(target.triplet)),)
    system = Windows
    all: win-build
endif

optimization.flags = -O3 -ffast-math -funroll-loops -fomit-frame-pointer


win-build:
	@echo $(arch)
	gcc -Wall ${optimization.flags} -I$(PDDIR)/src -I../vst-template $(SOURCES) -static-libgcc \
    -shared -L$(PDDIR)/bin -l:pd.dll -o vst2schedlib.dll
	strip vst2schedlib.dll
	cp vst2schedlib.dll ../build/vst2schedlib.dll
	
linux-build:
	gcc -DPD_WATCHDOG=1 -Wall ${optimization.flags} -I$(PDDIR)/src -I../vst-template -I. \
	$(SOURCES) -fPIC -shared -lpthread -lc -lrt -o vst2schedlib.pd_linux
	strip vst2schedlib.pd_linux
	chmod 664 vst2schedlib.pd_linux
	cp vst2schedlib.pd_linux ../build/vst2schedlib.pd_linux

