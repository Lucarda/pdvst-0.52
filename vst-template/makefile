# Compile with MinGW.
# Download "vstsdk2_4.zip" from https://archive.org/download/VST2SDK
# extract the folder an place it:
#
# ├──build/
# ├──vst-scheduler/
# ├──vstsdk2.4/
# ├──vst-template/
#

FOO=../vstsdk2.4/
FOO2=../vstsdk2.4/public.sdk/source/vst2.x/


SOURCES= \
    pdvst.cpp \
    pdvstMain.cpp \
    pdvstEditor.cpp \
    $(FOO2)AudioEffect.cpp \
    $(FOO2)audioeffectx.cpp \
    cross-helper.cpp \
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
	g++ -Wall -I. -I$(FOO) -I$(FOO2) \
	$(SOURCES) -static-libgcc -static-libstdc++ -static -lpthread -shared -o pdvst-template.dll
	strip pdvst-template.dll
	cp pdvst-template.dll ../build/pdvst-template.dll
	cp pdvst-template.dll ../build/Pd_Gain.dll
	cp pdvst-template.dll ../build/Pd_Gain-gui.dll
	cp pdvst-template.dll ../build/Pd_Gain-nogui.dll
	cp pdvst-template.dll ../build/Pd_Midi.dll
	cp pdvst-template.dll ../build/Pd_Chunks-test.dll

	
	
