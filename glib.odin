foreign import glib "system:glib-2.0"

gint     :: i32;
gboolean :: b32;
guint    :: u32;
gpointer :: rawptr;

// GList is a doubly linked list
List :: struct {
	data: rawptr,
	next: ^List,
	prev: ^List,
}
