module sapp

// returns true after sokol-app has been initialized
fn C.sapp_isvalid() bool

// returns the current framebuffer width in pixels
fn C.sapp_width() int
fn C.sapp_widthf() f32

// returns the current framebuffer height in pixels
fn C.sapp_height() int
fn C.sapp_heightf() f32

// returns true when high_dpi was requested and actually running in a high-dpi scenario
fn C.sapp_high_dpi() bool

// returns the dpi scaling factor (window pixels to framebuffer pixels)
fn C.sapp_dpi_scale() f32

// show or hide the mobile device onscreen keyboard
fn C.sapp_show_keyboard(visible bool)

// return true if the mobile device onscreen keyboard is currently shown
fn C.sapp_keyboard_shown() bool

// show or hide the mouse cursor
fn C.sapp_show_mouse(visible bool)

// show or hide the mouse cursor
fn C.sapp_mouse_shown() bool

// return the userdata pointer optionally provided in sapp_desc
fn C.sapp_userdata() voidptr

// return a copy of the sapp_desc structure
fn C.sapp_query_desc() C.sapp_desc

// initiate a "soft quit" (sends SAPP_EVENTTYPE_QUIT_REQUESTED)
fn C.sapp_request_quit()

// cancel a pending quit (when SAPP_EVENTTYPE_QUIT_REQUESTED has been received)
fn C.sapp_cancel_quit()

// intiate a "hard quit" (quit application without sending SAPP_EVENTTYPE_QUIT_REQUSTED)
fn C.sapp_quit()

// call from inside event callback to consume the current event (don't forward to platform)
fn C.sapp_consume_event()

// get the current frame counter (for comparison with sapp_event.frame_count)
fn C.sapp_frame_count() u64

// write string into clipboard
fn C.sapp_set_clipboard_string(str &byte)

// read string from clipboard (usually during SAPP_EVENTTYPE_CLIPBOARD_PASTED)
fn C.sapp_get_clipboard_string() &byte

// special run-function for SOKOL_NO_ENTRY (in standard mode this is an empty stub)
fn C.sapp_run(desc &C.sapp_desc) int

// GL: return true when GLES2 fallback is active (to detect fallback from GLES3)
fn C.sapp_gles2() bool

// HTML5: enable or disable the hardwired "Leave Site?" dialog box
fn C.sapp_html5_ask_leave_site(ask bool)

// Metal: get ARC-bridged pointer to Metal device object
fn C.sapp_metal_get_device() voidptr

// Metal: get ARC-bridged pointer to this frame's renderpass descriptor
fn C.sapp_metal_get_renderpass_descriptor() voidptr

// Metal: get ARC-bridged pointer to current drawable
fn C.sapp_metal_get_drawable() voidptr

// macOS: get ARC-bridged pointer to macOS NSWindow
// fn C.sapp_macos_get_window() voidptr

// iOS: get ARC-bridged pointer to iOS UIWindow
fn C.sapp_ios_get_window() voidptr

// D3D11: get pointer to ID3D11Device object
fn C.sapp_d3d11_get_device() voidptr

// D3D11: get pointer to ID3D11DeviceContext object
fn C.sapp_d3d11_get_device_context() voidptr

// D3D11: get pointer to ID3D11RenderTargetView object
fn C.sapp_d3d11_get_render_target_view() voidptr

// D3D11: get pointer to ID3D11DepthStencilView
fn C.sapp_d3d11_get_depth_stencil_view() voidptr

// Win32: get the HWND window handle
fn C.sapp_win32_get_hwnd() voidptr

// Android: get native activity handle
fn C.sapp_android_get_native_activity() voidptr

// open a new window and return window handle
fn C.sapp_open_window(desc &C.sapp_window_desc) C.sapp_window

// close a window
fn C.sapp_close_window(window C.sapp_window)

// test if a window handle is valid
fn C.sapp_window_valid(window C.sapp_window) bool

// start rendering into a window
fn C.sapp_activate_window_context(window C.sapp_window)

// return an array index for a window handle (to associate your own data with window handle)
fn C.sapp_window_slot_index(window C.sapp_window) int

// get the main window handle
fn C.sapp_main_window() C.sapp_window

// start iterating over windows
fn C.sapp_first_window() C.sapp_window

// continue iterating over windows, returns invalid handle when finished
fn C.sapp_next_window(window C.sapp_window) C.sapp_window

// show a hidden window
fn C.sapp_show_window(window C.sapp_window)

// hide a visible window
fn C.sapp_hide_window(window C.sapp_window)

// return true if a window is currently visible
fn C.sapp_window_visible(window C.sapp_window) bool

// make window focused (bring to front and get keyboard input focus)
fn C.sapp_focus_window(window C.sapp_window)

// test if window is the focus window
fn C.sapp_window_focused(window C.sapp_window) bool

// test if window is minimized
fn C.sapp_window_minimized(window C.sapp_window) bool

// get window's framebuffer width in pixels
fn C.sapp_window_width(window C.sapp_window) int

// same as sapp_window_width(), but returns float
fn C.sapp_window_widthf(window C.sapp_window) f32

// get window's framebuffer height in pixels
fn C.sapp_window_height(window C.sapp_window) int

// same as sapp_window_height(), but returns float
fn C.sapp_window_heightf(window C.sapp_window) f32

// set window's client rect size in logical 'window system pixels'
fn C.sapp_window_set_client_size(window C.sapp_window, width int, height int)

// same as sapp_window_set_client_size(), but with float parameters
fn C.sapp_window_set_client_sizef(window C.sapp_window, width f32, height f32)

// get window's client rect width in logical 'window system pixels'
fn C.sapp_window_client_width(window C.sapp_window) int

// same as sapp_window_client_width() but returns float
fn C.sapp_window_client_widthf(window C.sapp_window) f32

// get window's client rect height in logical 'window system pixels'
fn C.sapp_window_client_height(window C.sapp_window) int

// same as sapp_client_height() but returns float
fn C.sapp_window_client_heightf(window C.sapp_window) f32

// set window's client rect position in logical 'window system pixels'
fn C.sapp_window_set_client_pos(window C.sapp_window, x int, y int)

// same as sapp_window_set_client_pos(), but with float parameters
fn C.sapp_window_set_client_posf(window C.sapp_window, x f32, y f32)

// get window's client rect horizontal position in logical 'window system pixels'
fn C.sapp_window_client_posx(window C.sapp_window) int

// same as sapp_window_client_posx(), but returns float
fn C.sapp_window_client_posxf(window C.sapp_window) f32

// get window's client rect vertical position in logical 'window system pixels'
fn C.sapp_window_client_posy(window C.sapp_window) int

// same as sapp_window_client_posy(), but returns float
fn C.sapp_window_client_posyf(window C.sapp_window) f32

// get a window's sample count
fn C.sapp_window_sample_count(window C.sapp_window) int

// returns true when high_dpi was requested for a window, and actually running in a high-dpi scenario
fn C.sapp_window_high_dpi(window C.sapp_window) bool

// returns a window's dpi scaling factor (window pixels to framebuffer pixels)
fn C.sapp_window_dpi_scale(window C.sapp_window) f32

// query if a window is currently in fullscreen mode
fn C.sapp_window_is_fullscreen(window C.sapp_window) bool

// toggle a window to and from fullscreen mode
fn C.sapp_window_toggle_fullscreen(window C.sapp_window)

// set window title (only on desktop platforms)
fn C.sapp_window_set_title(window C.sapp_window, str &char)

// get window userdata pointer
fn C.sapp_window_userdata(window C.sapp_window) voidptr
