import "core:fmt.odin"
import "core:strings.odin"
import gtk "gtk2.odin"
import gdk "gdk2.odin"
import g "glib.odin"

main :: proc() {
	fmt.println("starting up...");

	gtk.init(nil, nil); // TODO(renehsz): Should take in argc, argv but I don't know how to do that in Odin

	window := gtk.window_new(gtk.WindowType.WINDOW_TOPLEVEL);
	gtk.window_set_title(cast(^gtk.Window) window, strings.new_c_string("Hello, world!"));

	gtk.widget_show(window);
	
	gtk.gtk_main();
}

