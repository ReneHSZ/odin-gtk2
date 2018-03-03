foreign import gobj "system:gobject-2.0"
foreign import glib "system:glib-2.0"
import "core:c.odin";
import "core:strings.odin";

gint     :: i32;
gboolean :: b32;
guint    :: u32;
gulong   :: c.c_ulong;
gpointer :: rawptr;

// GList is a doubly linked list
List :: struct {
	data: rawptr,
	next: ^List,
	prev: ^List,
}

Closure :: struct {
	in_marshal: guint = 1,
	is_invalid: guint = 1,
}

ConnectFlags :: enum {
	AFTER,
	SWAPPED,
}

ClosureNotify :: ^proc(data: gpointer, closure: ^Closure);

/* Note(ReneHSZ): Not all callbacks take no arguments...
 *   In C we can just cast any function to a Callback function pointer, in
 *   Odin this does not seem to be easily possible...
 *   For now we just use rawptrs.
 * see
 *  https://developer.gnome.org/gobject/stable/gobject-Closures.html#GCallback
 * for more info                                                            */
Callback :: rawptr;

// TODO(ReneHSZ): Replace rawptrs with specific struct pointers
ClosureMarshal :: ^proc(closure, return_value: rawptr, n_param_values: guint, param_values, invocation_hint, marshal_data: rawptr);

signal_connect :: proc(instance: gpointer, detailed_signal: string, c_handler: Callback, data: gpointer) -> gulong
 do return signal_connect_data(instance, strings.new_c_string(detailed_signal), c_handler, data, nil, cast(ConnectFlags) 0);

@(default_calling_convention="c")
foreign glib {
	/* TODO(ReneHSZ): @Bug @MustFix
	 * g_signal_connect_data is not found by the linker, even though we link in
	 * all libs from `pkg-config --libs gtk+-2.0`... It's really weird. Have to
	 * look into that */
	@(link_name="g_signal_connect_data") signal_connect_data :: proc(instance: gpointer, detailed_signal: ^byte, c_handler: Callback, data: gpointer, destroy_data: ClosureNotify, connect_flags: ConnectFlags) -> gulong ---;
}
