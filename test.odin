import "core:fmt.odin"
import gtk "gtk2.odin"

main :: proc() {
	fmt.println("starting up...");

	gtk.init(nil, nil); // TODO(renehsz): Should take in argc, argv but I don't know how to do that in Odin

	window := gtk.window_new(gtk.WindowType.WINDOW_TOPLEVEL);
	gtk.widget_show(window);

	gtk.gtk_main();
}
