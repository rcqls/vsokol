#### Platform detections and overrides:
_SYS := $(shell uname 2>/dev/null || echo Unknown)
_SYS := $(patsubst MSYS%,MSYS,$(_SYS))
_SYS := $(patsubst MINGW%,MinGW,$(_SYS))

DLL_EXT := so
ifneq ($(filter $(_SYS),MSYS MinGW),)
WIN32 := 1
DLL_EXT := dll
endif

ifeq ($(_SYS),Linux)
LINUX := 1
endif

ifeq ($(_SYS),Darwin)
MAC := 1
DLL_EXT := dylib
MAKEARGS := -f ../../extra/Makefile.cimgui
endif

CIMGUI:=cimgui
IMGUI:=$(CIMGUI)/imgui
CFLAGS:=-I. 
CFLAGS+=-DCIMGUI_DEFINE_ENUMS_AND_STRUCTS=1
CFLAGS+=-DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1
CFLAGS+=-DIMGUI_IMPL_API

lib: cimgui.$(DLL_EXT)

all: thirdparty cimgui/make

cimgui/make:
	(cd thirdparty/cimgui; make $(MAKEARGS))
	(mkdir -p lib; cp thirdparty/cimgui/cimgui.$(DLL_EXT) lib/)

cimgui/cmake:
	(export CFLAGS= CXXFLAGS= ; cd thirdparty/cimgui ; mkdir bld ; cd bld ; cmake .. ; make)
	(mkdir -p lib; cp thirdparty/cimgui/bld/cimgui.$(DLL_EXT) lib/)

thirdparty: thirdparty/cimgui thirdparty/sokol

thirdparty/cimgui: 
	(mkdir -p thirdparty)
	(cd thirdparty; [ -d thirdparty/cimgui ] || git clone --recursive https://github.com/cimgui/cimgui.git)

thirdparty/sokol:
	(mkdir -p thirdparty)
	(cd thirdparty; [ -d thirdparty/sokol ] || git clone --recursive https://github.com/floooh/sokol.git)

clean:
	$(RM) *.o lib/*.$(DLL_EXT) thirdparty/cimgui/cimgui.$(DLL_EXT) $(TARGET)

distclean: clean
	rm -Rf thirdparty/cimgui