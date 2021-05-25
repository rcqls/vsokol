module imgui

import vsokol.sapp
import vsokol.gfx

pub const (
	used_import = gfx.used_import + sapp.used_import
)

pub fn setup() {
	simgui_desc := &C.simgui_desc_t{
		max_vertices: 65536
		// color_format: .rgba8
		// depth_format: .depth_stencil
		// sample_count: 1
		dpi_scale: sapp.dpi_scale()
		ini_filename: 0
		no_default_font: false
		disable_hotkeys: false
	}
	C.simgui_setup(simgui_desc)
}

pub fn new_frame(w int, h int, dt f32) {
	C.simgui_new_frame(w, h, dt)
}

pub fn render() {
	C.simgui_render()
}

pub fn handle_event(ev &C.sapp_event) bool {
	return C.simgui_handle_event(ev)
}

pub fn shutdown() {
	C.simgui_shutdown()
}

// pub fn show_demo_window(open &bool) {
// 	C.igShowDemoWindow(open)
// }
