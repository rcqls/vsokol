module imgui

fn C.simgui_setup(desc &C.simgui_desc_t)
fn C.simgui_new_frame(width int, height int, delta_time f32)
fn C.simgui_render()
fn C.simgui_handle_event(ev &C.sapp_event) bool
fn C.simgui_shutdown()

fn C.igText(&byte, ...voidptr)
fn C.igShowDemoWindow(p_open voidptr)
