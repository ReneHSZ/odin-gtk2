package glib

foreign import gobj "system:gobject-2.0"
foreign import glib "system:glib-2.0"
import "core:c";
import "core:strings";

gint     :: i32;
gboolean :: b32;
guint    :: u32;
gulong   :: c.ulong;
gpointer :: rawptr;

// GList is a doubly linked list
List :: struct {
	data: rawptr,
	next: ^List,
	prev: ^List,
}

Closure :: struct {
	in_marshal: guint,
	is_invalid: guint,
}

ConnectFlags :: enum {
	AFTER,
	SWAPPED,
}

ClosureNotify :: ^proc(data: gpointer, closure: ^Closure);

/* NOTE(renehsz): Not all callbacks take no arguments...
 *   In C we can just cast any function to a Callback function pointer, in
 *   Odin this does not seem to be easily possible...
 *   For now we just use rawptrs.
 * see
 *  https://developer.gnome.org/gobject/stable/gobject-Closures.html#GCallback
 * for more info                                                            */
Callback :: distinct rawptr;

// TODO(renehsz): Replace rawptrs with specific struct pointers
ClosureMarshal :: ^proc(closure, return_value: rawptr, n_param_values: guint, param_values, invocation_hint, marshal_data: rawptr);

// TODO(renehsz): Is this clone_to_cstring a leak?
signal_connect :: proc(instance: gpointer, detailed_signal: string, c_handler: Callback, data: gpointer) -> gulong
 do return signal_connect_data(instance, strings.clone_to_cstring(detailed_signal), c_handler, data, nil, cast(ConnectFlags) 0);

@(default_calling_convention="c")
foreign gobj {
	@(link_name="g_signal_connect_data") signal_connect_data :: proc(instance: gpointer, detailed_signal: cstring, c_handler: Callback, data: gpointer, destroy_data: ClosureNotify, connect_flags: ConnectFlags) -> gulong ---;
}

