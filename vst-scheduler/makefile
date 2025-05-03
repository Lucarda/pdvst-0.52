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
endif

ifneq ($(filter darwin%, $(target.triplet)),)
    system = Darwin
endif

ifneq ($(filter mingw% cygwin%, $(target.triplet)),)
    system = Windows
    all: win-build
endif



win-build:
	@echo $(arch)
	gcc -Wall -I$(PDDIR)/src -I../vst-template $(SOURCES) -static-libgcc \
    -shared -L$(PDDIR)/bin -l:pd.dll -o vstschedlib.dll
	strip vstschedlib.dll
	#cp vstschedlib.dll ../build/pd-scheduler$(arch)/vstschedlib.dll
	cp vstschedlib.dll ../build/.pd/bin/vstschedlib.dll
	#cp vstschedlib.dll ../build/Release$(arch)/vstschedlib.dll
	
linux-build:
	g++ -Wall -I. -I$(FOO) -I$(FOO2) \
	$(SOURCES) -D__cdecl="" -fPIC -std=c++11 -shared -ldl -o dummy-template.so
	strip dummy-template.so
