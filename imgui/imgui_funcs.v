module imgui

fn C.simgui_setup(desc &C.simgui_desc_t)
fn C.simgui_new_frame(width int, height int, delta_time f32)
fn C.simgui_render()
fn C.simgui_handle_event(ev &C.sapp_event) bool
fn C.simgui_shutdown()

// fn C.igCheckbox(label voidptr, p_open voidptr)
// fn C.igGetIO() voidptr
// fn C.igCreateContext(shared_font_atlas voidptr) voidptr
// fn C.igStyleColorsDark(dst voidptr)
// fn C.ImGui_ImplSDL2_InitForOpenGL(window voidptr, sdl_gl_context voidptr) bool
// fn C.ImGui_ImplOpenGL3_Init(glsl_version byteptr) bool
// fn C.ImGui_ImplSDL2_ProcessEvent(event voidptr) bool
// fn C.ImGui_ImplOpenGL3_NewFrame()
// fn C.ImGui_ImplSDL2_NewFrame(window voidptr)
// fn C.igNewFrame()
// fn C.igShowDemoWindow(p_open voidptr)
// fn C.igBegin(name byteptr, p_open voidptr, flags int) bool
// fn C.igText(byteptr, ...voidptr)
// //fn C.printf(&char, ...voidptr) int
// //fn C.igText()
// fn C.igSliderFloat(label byteptr, v voidptr, v_min f32, v_max f32, format byteptr, power f32) bool
// fn C.igColorEdit3(label byteptr, col voidptr, flags int) bool
// fn C.igButton(label byteptr, size C.ImVec2) bool
// fn C.igSameLine(offset_from_start_x f32, spacing f32)
// fn C.igEnd()
// fn C.igRender()
// fn C.igGetDrawData() voidptr
// fn C.ImGui_ImplOpenGL3_RenderDrawData(draw_data voidptr)
// fn C.glViewport(int, int, int, int)
// fn C.glClear(int)
// fn C.glClearColor(f32, f32, f32, f32)
// fn C.glewInit() int
// fn C.nk_window_get_bounds() C.nk_rect
