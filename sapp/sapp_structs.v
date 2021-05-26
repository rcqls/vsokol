module sapp

pub struct C.sapp_desc {
pub:
	init_cb    fn () // these are the user-provided callbacks without user data
	frame_cb   fn ()
	cleanup_cb fn ()
	event_cb   fn (&C.sapp_event) //&sapp_event)

	init_userdata_cb    fn (voidptr)
	frame_userdata_cb   fn (voidptr)
	cleanup_userdata_cb fn (voidptr)
	event_userdata_cb   fn (&C.sapp_event, voidptr)

	user_data           		 voidptr // these are the user-provided callbacks with user data
	window_pool_size			 int
    window_title                 &char // the window title as UTF-8 encoded string           // the window title as UTF-8 encoded string
    x							 int
    y							 int
	width                        int   // the preferred width of the window / canvas
	height                       int   // the preferred height of the window / canvas
	sample_count                 int   // MSAA sample count
	swap_interval                int   // the preferred swap interval (ignored on some platforms)
	high_dpi                     bool  // whether the rendering canvas is full-resolution on HighDPI displays
	fullscreen                   bool  // whether the window should be created in fullscreen mode
	alpha                        bool  // whether the framebuffer should have an alpha channel (ignored on some platforms)
	user_cursor                  bool  // if true, user is expected to manage cursor image in SAPP_EVENTTYPE_UPDATE_CURSOR
	no_decoration				 bool  // create main window without window system decorations (title bar etc...)

	enable_dragndrop             bool  // enable file dropping (drag'n'drop), default is false
	max_dropped_files            int   // max number of dropped files to process (default: 1)
	max_dropped_file_path_length int   // max length in bytes of a dropped UTF-8 file path (default: 2048)
	enable_clipboard             bool  // enable clipboard access, default is false
	clipboard_size               int   // max size of clipboard content in bytes
	icon 						 C.sapp_icon_desc
	
	// backend-specific options
	gl 							C.sapp_gl_desc
    win32 						C.sapp_win32_desc
    html5 						C.sapp_html5_desc
    ios 						C.sapp_ios_desc
	
	fail_user_data      voidptr
	fail_cb    			fn (&byte)
	fail_userdata_cb    fn (&char, voidptr)
}

pub struct Event {
pub:
	frame_count        u64
	typ                EventType
	key_code           KeyCode
	char_code          u32
	key_repeat         bool
	modifiers          u32
	mouse_button       MouseButton
	mouse_x            f32
	mouse_y            f32
	mouse_dx           f32
	mouse_dy           f32
	scroll_x           f32
	scroll_y           f32
	num_touches        int
	touches            [8]C.sapp_touchpoint
	window_width       int
	window_height      int
	framebuffer_width  int
	framebuffer_height int
}

pub struct C.sapp_event {
pub:
	frame_count        u64
	window 			   C.sapp_window
	@type              EventType
	key_code           KeyCode
	char_code          u32
	key_repeat         bool
	modifiers          u32
	mouse_button       MouseButton
	mouse_x            f32
	mouse_y            f32
	mouse_dx           f32
	mouse_dy           f32
	scroll_x           f32
	scroll_y           f32
	num_touches        int
	touches            [8]C.sapp_touchpoint
	window_width       int
	window_height      int
	framebuffer_width  int
	framebuffer_height int
}

pub fn (e &C.sapp_event) str() string {
	t := e.@type
	return 'evt: frame_count=$e.frame_count, type=$t'
}

pub struct C.sapp_touchpoint {
pub:
	identifier u64
	pos_x      f32
	pos_y      f32
	changed    bool
}

// NEW for sapp-multiwindow
pub struct C.sapp_window {
pub:
	id u32
}

pub struct C.sapp_icon_desc {
    sokol_default 	bool
    images 			[8]C.sapp_image_desc
}

pub struct C.sapp_image_desc {
    width 		int
    height		int
    pixels 		C.sapp_range
}

pub struct C.sapp_range {
    ptr 	voidptr
    size	u32
}

pub struct C.sapp_gl_desc {
    force_gles2 bool                   // if true, setup GLES2/WebGL even if GLES3/WebGL2 is available
}

pub struct C.sapp_win32_desc {
	console_utf8 	bool                  // if true, set the output console codepage to UTF-8
    console_create	bool                // if true, attach stdout/stderr to a new console window
    console_attach  bool                // if true, attach stdout/stderr to parent process
}

pub struct C.sapp_html5_desc {
    canvas_name 			&char            // the name (id) of the HTML5 canvas element, default is "canvas"
    canvas_resize 			bool                 // if true, the HTML5 canvas size is set to sapp_desc.width/height, otherwise canvas size is tracked
    preserve_drawing_buffer bool       // HTML5 only: whether to preserve default framebuffer content between frames
    premultiplied_alpha    	bool           // HTML5 only: whether the rendered pixels use premultiplied alpha convention
    ask_leave_site			bool                // initial state of the internal html5_ask_leave_site flag (see sapp_html5_ask_leave_site())
}

pub struct C.sapp_ios_desc {
    keyboard_resizes_canvas bool       // if true, showing the iOS keyboard shrinks the canvas
} 
