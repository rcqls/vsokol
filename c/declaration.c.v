module c

pub const (
	used_import = 1
)

$if vroot ? {
	#flag -I @VEXEROOT/thirdparty/sokol
	#flag -I @VEXEROOT/thirdparty/sokol/util
} $else {
	#flag -I @VMODROOT/thirdparty/sokol
	#flag -I @VMODROOT/thirdparty/sokol/util
	#flag -I @VMODROOT/thirdparty/cimgui
}
#flag -DCIMGUI_DEFINE_ENUMS_AND_STRUCTS=1
#flag -DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1
#flag -DIMGUI_IMPL_API=
#flag -DSOKOL_IMGUI_IMPL
#flag freebsd -I /usr/local/include
#flag darwin -fobjc-arc
#flag linux -lX11 -lGL -lXcursor -lXi -lpthread
#flag freebsd -L/usr/local/lib -lX11 -lGL -lXcursor -lXi
#flag windows -lgdi32
#flag darwin -rpath @VMODROOT/imgui @VMODROOT/imgui/cimgui.dylib
#flag linux @VMODROOT/imgui/cimgui.so
// METAL
$if macos {
	#flag -DSOKOL_METAL
	#flag -framework Metal -framework Cocoa -framework MetalKit -framework QuartzCore
}
$if ios {
	#flag -DSOKOL_METAL
	#flag -framework Foundation -framework Metal -framework MetalKit -framework UIKit
}
// OPENGL
#flag linux -DSOKOL_GLCORE33
#flag freebsd -DSOKOL_GLCORE33
//#flag darwin -framework OpenGL -framework Cocoa -framework QuartzCore
// D3D
#flag windows -DSOKOL_GLCORE33
//#flag windows -DSOKOL_D3D11
// for simplicity, all header includes are here because import order matters and we dont have any way
// to ensure import order with V yet
#define SOKOL_IMPL
// TODO should not be defined for android graphic (apk/aab using sokol) builds, but we have no ways to undefine
//#define SOKOL_NO_ENTRY
#flag linux   -DSOKOL_NO_ENTRY
#flag darwin  -DSOKOL_NO_ENTRY
#flag windows -DSOKOL_NO_ENTRY
#flag windows -DSOKOL_WIN32_FORCE_MAIN
#flag freebsd -DSOKOL_NO_ENTRY
#flag solaris -DSOKOL_NO_ENTRY
// TODO end

#flag linux -ldl

$if gcboehm ? {
	#define SOKOL_MALLOC GC_MALLOC
	#define SOKOL_CALLOC(n,m) GC_MALLOC((n)*(m))
	#define SOKOL_REALLOC GC_REALLOC
	#define SOKOL_FREE GC_FREE
}

#include "sokol_v.h"
#include "sokol_app.h"
#define SOKOL_IMPL
#define SOKOL_NO_DEPRECATED
#include "sokol_gfx.h"
#include "cimgui.h"
#include "util/sokol_imgui.h"
#define SOKOL_GL_IMPL
#include "util/sokol_gl.h"