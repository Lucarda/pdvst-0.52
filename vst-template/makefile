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
$(empty)

WINARCH := $(shell $(CC) -dumpmachine)

ifneq (,$(findstring i686,$(WINARCH)))
	arch = 32
else
	arch = 64
endif


ALL: $(SOURCES)
	g++ -Wall -I. -I$(FOO) -I$(FOO2) \
	$(SOURCES) -static-libgcc -static-libstdc++ -static -lpthread -shared -o pdvst-template.dll
	strip pdvst-template.dll
	cp pdvst-template.dll ../build/Release$(arch)/pdvst-template.dll
	cp pdvst-template.dll ../build/Release$(arch)/Pd_Gain.dll
	cp pdvst-template.dll ../build/Release$(arch)/Pd_Gain-gui.dll
	cp pdvst-template.dll ../build/Release$(arch)/Pd_Gain-nogui.dll
	cp pdvst-template.dll ../build/Release$(arch)/Pd_Midi.dll
	cp pdvst-template.dll ../build/Release$(arch)/Pd_Chunks-test.dll

	
	
