foreign import gdk2 "system:gdk-x11-2.0"

Color :: struct {
	pixel: u32,
	red:   u16,
	green: u16,
	blue:  u16,
}

GC_FOREGROUND :: 1 << 0;

GC :: struct {
	// TODO!
}

Pixmap :: struct {
	// TODO!
}
