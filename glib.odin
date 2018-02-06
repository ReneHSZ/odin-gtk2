foreign import glib "system:glib-2.0"

gint     :: i32;
gboolean :: i32;
guint    :: u32;
gpointer :: rawptr;

// GList is a doubly linked list
List :: struct {
	data: rawptr,
	next: ^List,
	prev: ^List,
}

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
