# call this makefile with:
#   make PDDIR=<absoulte/path/to/pd>
# or you can specify it below:

PDDIR=""

all:
	$(MAKE) -C ./vst-template
	$(MAKE) -C ./vst-scheduler PDDIR=$(PDDIR)



