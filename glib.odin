foreign import glib "system:glib-2.0"

import "core:c.odin"

gint     :: #alias c.c_int;
gboolean :: #alias c.c_int;
guint    :: #alias c.c_uint;
gpointer :: #alias rawptr;

gboolean_to_bool :: proc(b: gboolean) -> bool {
	return b != 0;
}

bool_to_gboolean :: proc(b: bool) -> gboolean {
	if (b) {
		return -1;
	} else {
		return 0;
	}
}
