module vsokol

import vsokol.c
import vsokol.f

pub const (
	used_import = c.used_import + f.used_import
)

/*
pub enum Key {
	up=C.SAPP_KEYCODE_UP
	left = C.SAPP_KEYCODE_LEFT
	right =C.SAPP_KEYCODE_RIGHT
	down = C.SAPP_KEYCODE_DOWN
	escape = C.SAPP_KEYCODE_ESCAPE
	space = C.SAPP_KEYCODE_SPACE
}
*/
