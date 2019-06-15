package gdk2

foreign import gdk2 "system:gdk-x11-2.0"
foreign import gdk_pixbuf "system:gdk_pixbuf-2.0"

import g "../glib"

Color :: struct {
	pixel: u32,
	red:   u16,
	green: u16,
	blue:  u16,
}

GC_FOREGROUND :: 1 << 0;

GC :: struct {
	// TODO(renehsz): Fill this out
}

Pixmap :: struct {
	// TODO(renehsz): Fill this out
}

Pixbuf :: struct {
	// TODO(renehsz): Fill this out
}

Screen :: struct {
	// TODO(renehsz): Fill this out
}

Geometry :: struct {
	min_width:    g.gint,
	min_height:   g.gint,
	max_width:    g.gint,
	max_height:   g.gint,
	base_width:   g.gint,
	base_height:  g.gint,
	width_inc:    g.gint,
	height_inc:   g.gint,
	min_aspect:   f64,
	max_aspect:   f64,
	win_gravity:  Gravity,
}

Window :: struct {};

Event :: struct {
	// TODO(renehsz): Fill this out
}

EventKey :: struct {
	event_type:       EventType,
	window:           ^Window,
	send_event:       i8,
	time:             u32,
	state:            g.guint,
	keyval:           g.guint,
	length:           g.gint,
	str:              ^byte,
	hardware_keycode: u16,
	group:            u8,
	is_modifier:      g.guint,
}

EventType :: enum i32 {
	NOTHING,
	DELETE,
	DESTROY,
	EXPOSE,
	MOTION_NOTIFY,
	BUTTON_PRESS,
	TWO_BUTTON_PRESS,
	THREE_BUTTON_PRESS,
	BUTTON_RELEASE,
	KEY_PRESS,
	KEY_RELEASE,
	ENTER_NOTIFY,
	LEAVE_NOTIFY,
	FOCUS_CHANGE,
	CONFIGURE,
	MAP,
	UNMAP,
	PROPERTY_NOTIFY,
	SELECTION_CLEAR,
	SELECTION_REQUEST,
	SELECTION_NOTIFY,
	PROXIMITY_IN,
	PROXIMITY_OUT,
	DRAG_ENTER,
	DRAG_LEAVE,
	DRAG_MOTION,
	DRAG_STATUS,
	DROP_START,
	DROP_FINISHED,
	CLIENT_EVENT,
	VISIBILITY_NOTIFY,
	NO_EXPOSE,
	SCROLL,
	WINDOW_STATE,
	SETTING,
	OWNER_CHANGE,
	GRAB_BROKEN,
	DAMAGE,
	EVENT_LAST,
}

Gravity :: enum i32 {
	NORTH_WEST,
	NORTH,
	NORTH_EAST,
	WEST,
	CENTER,
	EAST,
	SOUTH_WEST,
	SOUTH,
	SOUTH_EAST,
	STATIC,
}

WindowHints :: enum i32 {
	POS,
	MIN_SIZE,
	MAX_SIZE,
	BASE_SIZE,
	ASPECT,
	RESIZE_INC,
	WIN_GRAVITY,
	USER_POS,
	USER_SIZE,
}

WindowEdge :: enum i32 {
	NORTH_WEST,
	NORTH,
	NORTH_EAST,
	WEST,
	EAST,
	SOUTH_WEST,
	SOUTH,
	SOUTH_EAST,
}

WindowTypeHint :: enum i32 {
	NORMAL,
	DIALOG,
	MENU,
	TOOLBAR,
	SPLASHSCREEN,
	UTILITY,
	DOCK,
	DESKTOP,
	DROPDOWN_MENU,
	POPUP_MENU,
	TOOLTIP,
	NOTIFICATION,
	COMBO,
	DND,
}

ModifierType :: enum i32 {
	// TODO(renehsz): Are the values below correct? Do they just count from 0? Mask sounds like it would be a bitmask...
	SHIFT_MASK,
	LOCK_MASK,
	CONTROL_MASK,
	MOD1_MASK,
	MOD2_MASK,
	MOD3_MASK,
	MOD4_MASK,
	MOD5_MASK,
	BUTTON1_MASK,
	BUTTON2_MASK,
	BUTTON3_MASK,
	BUTTON4_MASK,
	BUTTON5_MASK,
	SUPER_MASK,
	HYPER_MASK,
	META_MASK,
	RELEASE_MASK,
	MODIFIER_MASK,
}
