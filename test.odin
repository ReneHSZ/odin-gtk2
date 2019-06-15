package main

import "core:fmt"
import "core:strings"
import gtk "gtk2"
import gdk "gdk2"
import g   "glib"

main :: proc() {
	fmt.println("starting up...");

	argc := 0;
	gtk.init(&argc, nil); // TODO(renehsz): Should take in argc, argv but I don't know how to do that in Odin

	window := gtk.window_new(gtk.WindowType.WINDOW_TOPLEVEL);
	gtk.window_set_title(cast(^gtk.Window) window, cast(cstring) "Hello, world!");

	gtk.widget_show(window);
	
	gtk.gtk_main();
}

