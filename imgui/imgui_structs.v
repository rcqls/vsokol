module imgui

import vsokol.gfx

pub struct C.simgui_desc_t {
	max_vertices    int
	color_format    gfx.PixelFormat
	depth_format    gfx.PixelFormat
	sample_count    int
	dpi_scale       f32
	ini_filename    &char
	no_default_font bool
	disable_hotkeys bool // don't let ImGui handle Ctrl-A,C,V,X,Y,Z
}
