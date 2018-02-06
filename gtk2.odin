foreign import gtk2 "system:gtk-x11-2.0"
foreign import atk "system:atk-1.0"
foreign import cairo "system:cairo"
foreign import gdk_pixbuf "system:gdk_pixbuf-2.0"
foreign import gio "system:gio-2.0"
foreign import gobject "system:gobject-2.0"
foreign import fontconfig "system:fontconfig"
foreign import freetype "system:freetype"

import gdk "gdk2.odin"
import pango "pango.odin"

gboolean :: i32;

Style :: struct {
	fg:        [5]gdk.Color,
	bg:        [5]gdk.Color,
	light:     [5]gdk.Color,
	dark:      [5]gdk.Color,
	mid:       [5]gdk.Color,
	text:      [5]gdk.Color,
	base:      [5]gdk.Color,
	text_aa:   [5]gdk.Color,

	black:     gdk.Color,
	white:     gdk.Color,
	font_desc: ^pango.FontDescription,

	xthickness:i32,
	ythickness:i32,

	fg_gc:     ^[5]gdk.GC,
	bg_gc:     ^[5]gdk.GC,
	light_gc:  ^[5]gdk.GC,
	dark_gc:   ^[5]gdk.GC,
	mid_gc:    ^[5]gdk.GC,
	text_gc:   ^[5]gdk.GC,
	base_gc:   ^[5]gdk.GC,
	text_aa_gc:^[5]gdk.GC,
	black_gc:  ^gdk.GC,
	white_gc:  ^gdk.GC,

	bg_pixmap: ^[5]gdk.Pixmap,
}

Requisition :: struct {
	width:  i32,
	height: i32,
}

Allocation :: struct {
	x:      i32,
	y:      i32,
	width:  i32,
	height: i32,
}

WindowPrivate :: struct {
	// TODO!
}

Bin :: struct {
	// TODO!
}

Window :: struct {
	bin:  Bin,
	priv: ^WindowPrivate,
}

Widget :: struct {
	style:       ^Style,
	requisition: Requisition,
	allocation:  Allocation,
	window:      ^Window,
	parent:      ^Widget,
}

WindowType :: enum i32 {
	WINDOW_TOPLEVEL,
	WINDOW_POPUP,
}

@(default_calling_convention="c")
foreign gtk2 {
	@(link_name="gtk_init")        init        :: proc(argc: ^int, argv: ^^^byte) ---;
	@(link_name="gtk_main")        gtk_main    :: proc() ---;
	@(link_name="gtk_window_new")  window_new  :: proc(window_type: WindowType) -> ^Widget ---;
	@(link_name="gtk_widget_show") widget_show :: proc(widget: ^Widget) ---;
}
