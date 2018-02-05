import "core:fmt.odin"
import gtk "gtk2.odin"

main :: proc() {
	fmt.println("starting up...");

	window := gtk.window_new(gtk.WindowType.WINDOW_TOPLEVEL);
	gtk.widget_show(window);

	gtk.init(nil, nil);
	gtk.gtk_main();
}
