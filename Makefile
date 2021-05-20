DLL_EXT := dylib
CIMGUI:=cimgui
IMGUI:=$(CIMGUI)/imgui
CFLAGS:=-I. 
CFLAGS+=-DCIMGUI_DEFINE_ENUMS_AND_STRUCTS=1
CFLAGS+=-DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1
CFLAGS+=-DIMGUI_IMPL_API=

cimgui.$(DLL_EXT):
	(export CFLAGS= CXXFLAGS= ; cd thirdparty/cimgui ; mkdir bld ; cd bld ; cmake .. ; make)
	cp thirdparty/cimgui/bld/cimgui.$(DLL_EXT) imgui/

thirdparty: thirdparty/cimgui thirdparty/sokol

thirdparty/cimgui:
	(mkdir -p thirdparty)
	(cd thirdparty; [ -d thirdparty/cimgui ] || git clone --recursive https://github.com/cimgui/cimgui.git)

thirdparty/sokol:
	(mkdir -p thirdparty)
	(cd thirdparty; [ -d thirdparty/sokol ] || git clone --recursive https://github.com/floooh/sokol.git)

clean:
	$(RM) *.o *.$(DYN_EXT) $(TARGET)

distclean: clean
	rm -Rf third_party/cimgui