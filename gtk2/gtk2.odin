package gtk2

foreign import gtk2       "system:gtk-x11-2.0"
foreign import pthread    "system:pthread"
foreign import atk        "system:atk-1.0"
foreign import cairo      "system:cairo"
foreign import gio        "system:gio-2.0"
foreign import fontconfig "system:fontconfig"
foreign import freetype   "system:freetype"

import gdk   "../gdk2"
import g     "../glib"
import pango "../pango"

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

/* TODO(ReneHSZ): A window actually inherits from a Widget. Therefore you can
 * pass in a Window to a function taking a Widget and sometimes the other way
 * around. We cannot represent this well in this language. Possilby just take
 * in a rawptr everywhere?
 */
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

ModifierType :: enum i32 {
	SHIFT_MASK    = 1 << 0,
	LOCK_MASK     = 1 << 1,
	CONTROL_MASK  = 1 << 2,
	MOD1_MASK     = 1 << 3,
	MOD2_MASK     = 1 << 4,
	MOD3_MASK     = 1 << 5,
	MOD4_MASK     = 1 << 6,
	MOD5_MASK     = 1 << 7,
	BUTTON1_MASK  = 1 << 8,
	BUTTON2_MASK  = 1 << 9,
	BUTTON3_MASK  = 1 << 10,
	BUTTON4_MASK  = 1 << 11,
	BUTTON5_MASK  = 1 << 12,
	RELEASE_MASK  = 1 << 13,
	MODIFIER_MASK = 0x3fff,
}


AccelGroup :: struct {
	ref_count:      g.guint,
	lock_count:     g.guint,
	modifier_mask:  ModifierType,
	attach_objects: rawptr,
}

WindowType :: enum i32 {
	WINDOW_TOPLEVEL,
	WINDOW_POPUP,
}

WindowPosition :: enum i32 {
	NONE,
	CENTER,
	MOUSE,
	CENTER_ALWAYS,
	CENTER_ON_PARENT,
}

WindowGroup :: struct {
	// TODO(ReneHSZ): Fill out struct members!
}

@(default_calling_convention="c")
foreign gtk2 {
	@(link_name="gtk_init")                                       init                                       :: proc(argc: ^int, argv: ^^cstring) ---;
	@(link_name="gtk_main")                                       gtk_main                                   :: proc() ---;
	@(link_name="gtk_main_quit")                                  gtk_main_quit                              :: proc() ---;
	@(link_name="gtk_widget_show")                                widget_show                                :: proc(widget: ^Widget) ---;

	@(link_name="gtk_window_new")                                 window_new                                 :: proc(window_type: WindowType) -> ^Widget ---;
	@(link_name="gtk_window_set_title")                           window_set_title                           :: proc(window: ^Window, title: cstring) ---;
	@(link_name="gtk_window_set_wmclass")                         window_set_wmclass                         :: proc(window: ^Window, wmclass_name, wmclass_class: cstring) ---;
	@(link_name="gtk_window_set_policy")                          window_set_policy                          :: proc(window: ^Window, allow_shrink, allow_grow, auto_shrink: g.gint) ---;
	@(link_name="gtk_window_set_resizable")                       window_set_resizable                       :: proc(window: ^Window, resizable: g.gboolean) ---;
	@(link_name="gtk_window_get_resizable")                       window_get_resizable                       :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_add_accel_group")                     window_add_accel_group                     :: proc(window: ^Window, accel_group: ^AccelGroup) ---;
	@(link_name="gtk_window_remove_accel_group")                  window_remove_accel_group                  :: proc(window: ^Window, accel_group: ^AccelGroup) ---;
	@(link_name="gtk_window_activate_focus")                      window_activate_focus                      :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_activate_default")                    window_activate_default                    :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_set_modal")                           window_set_modal                           :: proc(window: ^Window, modal: g.gboolean) ---;
	@(link_name="gtk_window_set_default_size")                    window_set_default_size                    :: proc(window: ^Window, width, height: g.gint) ---;
	@(link_name="gtk_window_set_geometry_hints")                  window_set_geometry_hints                  :: proc(window: ^Window, geometry_widget: ^Widget, geometry: ^gdk.Geometry, geom_mask: gdk.WindowHints) ---;
	@(link_name="gtk_window_set_gravity")                         window_set_gravity                         :: proc(window: ^Window, gravity: gdk.Gravity) ---;
	@(link_name="gtk_window_get_gravity")                         window_get_gravity                         :: proc(window: ^Window) -> gdk.Gravity ---;
	@(link_name="gtk_window_set_position")                        window_set_position                        :: proc(window: ^Window, position: WindowPosition) ---;
	@(link_name="gtk_window_set_transient_for")                   window_set_transient_for                   :: proc(window, parent: ^Window) ---;
	@(link_name="gtk_window_set_destroy_with_parent")             window_set_destroy_with_parent             :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_screen")                          window_set_screen                          :: proc(window: ^Window, screen: ^gdk.Screen) ---;
	@(link_name="gtk_window_get_screen")                          window_get_screen                          :: proc(window: ^Window) -> ^gdk.Screen ---;
	@(link_name="gtk_window_is_active")                           window_is_active                           :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_has_toplevel_focus")                  window_has_toplevel_focus                  :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_list_toplevels")                      window_list_toplevels                      :: proc() -> g.List ---;
	@(link_name="gtk_window_add_mnemonic")                        window_add_mnemonic                        :: proc(window: ^Window, keyval: g.guint, target: ^Widget) ---;
	@(link_name="gtk_window_remove_mnemonic")                     window_remove_mnemonic                     :: proc(window: ^Window, keyval: g.guint, target: ^Widget) ---;
	@(link_name="gtk_window_mnemonic_activate")                   window_mnemonic_activate                   :: proc(window: ^Window, keyval: g.guint, modififer: gdk.ModifierType) -> g.gboolean ---;
	@(link_name="gtk_window_activate_key")                        window_activate_key                        :: proc(window: ^Window, event: ^gdk.EventKey) -> g.gboolean ---;
	@(link_name="gtk_window_propagate_key_event")                 window_propagate_key_event                 :: proc(window: ^Window, event: ^gdk.EventKey) -> g.gboolean ---;
	@(link_name="gtk_window_get_focus")                           window_get_focus                           :: proc(window: ^Window) -> ^Widget ---;
	@(link_name="gtk_window_set_focus")                           window_set_focus                           :: proc(window: ^Window, focus: ^Widget) ---;
	@(link_name="gtk_window_get_default_widget")                  window_get_default_widget                  :: proc(window: ^Window) -> ^Widget ---;
	@(link_name="gtk_window_set_default")                         window_set_default                         :: proc(window: ^Window, default_widget: ^Widget) ---;
	@(link_name="gtk_window_present")                             window_present                             :: proc(window: ^Window) ---;
	@(link_name="gtk_window_present_with_time")                   window_present_with_time                   :: proc(window: ^Window, timestamp: u32) ---;
	@(link_name="gtk_window_iconify")                             window_iconify                             :: proc(window: ^Window) ---;
	@(link_name="gtk_window_deiconify")                           window_deiconify                           :: proc(window: ^Window) ---;
	@(link_name="gtk_window_stick")                               window_stick                               :: proc(window: ^Window) ---;
	@(link_name="gtk_window_unstick")                             window_unstick                             :: proc(window: ^Window) ---;
	@(link_name="gtk_window_maximize")                            window_maximize                            :: proc(window: ^Window) ---;
	@(link_name="gtk_window_unmaximize")                          window_unmaximize                          :: proc(window: ^Window) ---;
	@(link_name="gtk_window_fullscreen")                          window_fullscreen                          :: proc(window: ^Window) ---;
	@(link_name="gtk_window_unfullscreen")                        window_unfullscreen                        :: proc(window: ^Window) ---;
	@(link_name="gtk_window_set_keep_above")                      window_set_keep_above                      :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_keep_below")                      window_set_keep_below                      :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_begin_resize_drag")                   window_begin_resize_drag                   :: proc(window: ^Window, edge: ^gdk.WindowEdge, button, root_x, root_y: g.gint, timestamp: u32) ---;
	@(link_name="gtk_window_begin_move_drag")                     window_begin_move_drag                     :: proc(window: ^Window, button, root_x, root_y: g.gint, timestamp: u32) ---;
	@(link_name="gtk_window_set_decorated")                       window_set_decorated                       :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_deletable")                       window_set_deletable                       :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_frame_dimensions")                window_set_frame_dimensions                :: proc(window: ^Window, left, top, right, bottom: g.gint) ---;
	@(link_name="gtk_window_set_has_frame")                       window_set_has_frame                       :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_mnemonic_modifier")               window_set_mnemonic_modifier               :: proc(window: ^Window, modifier: gdk.ModifierType) ---;
	@(link_name="gtk_window_set_type_hint")                       window_set_type_hint                       :: proc(window: ^Window, hint: gdk.WindowTypeHint) ---;
	@(link_name="gtk_window_set_skip_taskbar_hint")               windoW_set_skip_taskbar_hint               :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_skip_pager_hint")                 window_set_skip_pager_hint                 :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_urgency_hint")                    window_set_urgency_hint                    :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_accept_focus")                    window_set_accept_focus                    :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_focus_on_map")                    window_set_focus_on_map                    :: proc(window: ^Window, setting: g.gboolean) ---;
	@(link_name="gtk_window_set_startup_id")                      window_set_startup_id                      :: proc(window: ^Window, startup_id: ^byte) ---;
	@(link_name="gtk_window_set_role")                            window_set_role                            :: proc(window: ^Window, role: ^byte) ---;
	@(link_name="gtk_window_get_decorated")                       window_get_decorated                       :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_deletable")                       window_get_deletable                       :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_default_icon_list")               window_get_default_icon_list               :: proc() -> ^g.List ---;
	@(link_name="gtk_window_get_default_icon_name")               window_get_default_icon_name               :: proc() -> ^byte ---;
	@(link_name="gtk_window_get_default_size")                    window_get_default_size                    :: proc(window: ^Window, width, height: ^g.gint) ---;
	@(link_name="gtk_window_get_destroy_with_parent")             window_get_destroy_with_parent             :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_frame_dimensions")                window_get_frame_dimensions                :: proc(window: ^Window, left, top, right, bottom: ^g.gint) ---;
	@(link_name="gtk_window_has_frame")                           window_has_frame                           :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_icon")                            window_get_icon                            :: proc(window: ^Window) -> ^gdk.Pixbuf ---;
	@(link_name="gtk_window_get_icon_list")                       window_get_icon_list                       :: proc(window: ^Window) -> ^g.List ---;
	@(link_name="gtk_window_get_icon_name")                       window_get_icon_name                       :: proc(window: ^Window) -> ^byte ---;
	@(link_name="gtk_window_get_mnemonic_modifier")               window_get_mnemonic_modifier               :: proc(window: ^Window) -> gdk.ModifierType ---;
	@(link_name="gtk_window_get_modal")                           window_get_modal                           :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_position")                        window_get_position                        :: proc(window: ^Window, root_x, root_y: ^g.gint) ---;
	@(link_name="gtk_window_get_role")                            window_get_role                            :: proc(window: ^Window) -> ^byte ---;
	@(link_name="gtk_window_get_size")                            window_get_size                            :: proc(window: ^Window, width, height: ^g.gint) ---;
	@(link_name="gtk_window_get_title")                           window_get_title                           :: proc(window: ^Window) -> ^byte ---;
	@(link_name="gtk_window_get_transient_for")                   window_get_transient_for                   :: proc(window: ^Window) -> ^Window ---;
	@(link_name="gtk_window_get_type_hint")                       window_get_type_hint                       :: proc(window: ^Window) -> gdk.WindowTypeHint ---;
	@(link_name="gtk_window_get_skip_taskbar_hint")               window_get_skip_taskbar_hint               :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_skip_pager_hint")                 window_get_skip_pager_hint                 :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_urgency_hint")                    window_get_urgency_hint                    :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_accept_focus")                    window_get_accept_focus                    :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_focus_on_map")                    window_get_focus_on_map                    :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_group")                           window_get_group                           :: proc(window: ^Window) -> ^WindowGroup ---;
	@(link_name="gtk_window_has_group")                           window_has_group                           :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_get_window_type")                     window_get_window_type                     :: proc(window: ^Window) -> WindowType ---;
	@(link_name="gtk_window_move")                                window_move                                :: proc(window: ^Window, x, y: g.gint) ---;
	@(link_name="gtk_window_parse_geometry")                      window_parse_geometry                      :: proc(window: ^Window, geometry: ^byte) -> g.gboolean ---;
	@(link_name="gtk_window_reshow_with_initial_size")            window_reshow_with_initial_size            :: proc(window: ^Window) ---;
	@(link_name="gtk_window_resize")                              window_resize                              :: proc(window: ^Window, width, height: g.gint) ---;
	@(link_name="gtk_window_set_default_icon_list")               window_set_default_icon_list               :: proc(list: ^g.List) ---;
	@(link_name="gtk_window_set_default_icon")                    window_set_default_icon                    :: proc(icon: ^gdk.Pixbuf) ---;
	@(link_name="gtk_window_set_default_icon_name")               window_set_default_icon_name               :: proc(name: ^byte) ---;
	@(link_name="gtk_window_set_icon")                            window_set_icon                            :: proc(window: ^Window, icon: ^gdk.Pixbuf) ---;
	@(link_name="gtk_window_set_icon_list")                       window_set_icon_list                       :: proc(window: ^Window, list: ^g.List) ---;
	@(link_name="gtk_window_set_icon_name")                       window_set_icon_name                       :: proc(window: ^Window, name: ^byte) ---;
	@(link_name="gtk_window_set_auto_startup_notification")       window_set_auto_startup_notification       :: proc(setting: g.gboolean) ---;
	@(link_name="gtk_window_get_opacity")                         window_get_opacity                         :: proc(window: ^Window) -> f64 ---;
	@(link_name="gtk_window_set_opacity")                         window_set_opacity                         :: proc(window: ^Window, opacity: f64) ---;
	@(link_name="gtk_window_get_mnemonics_visible")               window_get_mnemonics_visible               :: proc(window: ^Window) -> g.gboolean ---;
	@(link_name="gtk_window_set_mnemonics_visible")               window_set_mnemonics_visible               :: proc(window: ^Window, setting: g.gboolean) ---;
}
