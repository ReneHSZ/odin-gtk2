package pango

foreign import pangocairo "system:pangocairo-1.0"
foreign import pangoft "system:pangoft2-1.0"
foreign import pango "system:pango-1.0"

import g "../glib"

/* Only pointers to structs are passed to functions in pango.
 * Therefore it is not that important to describe all struct members to the compiler. */

FontDescription :: struct {
	// TODO(renehsz): Fill all struct members
}

FontMetrics :: struct {
	// TODO(renehsz): Fill all struct members
}

Font :: struct {
	// TODO(renehsz): Fill all struct members	
}

Language :: struct {
	// TODO(renehsz): Fill all struct members	
}

EngineShape :: struct {
	// TODO(renehsz): Fill all struct members	
}

Coverage :: struct {
	// TODO(renehsz): Fill all struct members	
}

FontMap :: struct {
	// TODO(renehsz): Fill all struct members	
}

FontFamily :: struct {
	// TODO(renehsz): Fill all struct members	
}

FontFace :: struct {
	// TODO(renehsz): Fill all struct members	
}

Context :: struct {
	// TODO(renehsz): Fill all struct members	
}

Fontset :: struct {
	// TODO(renehsz): Fill all struct members	
}

FontsetSimple :: struct {
	// TODO(renehsz): Fill all struct members	
}

Rectangle :: struct {
	x, y, width, height: g.gint,
}


Style :: enum {
	NORMAL,
	OBLIQUE,
	ITALIC,
}

Variant :: enum {
	NORMAL,
	SMALL_CAPS,
}

Weight :: enum {
	THIN,
	ULTRALIGHT,
	LIGHT,
	SEMILIGHT,
	BOOK,
	NORMAL,
	MEDIUM,
	SEMIBOLD,
	BOLD,
	ULTRABOLD,
	HEAVY,
	ULTRAHEAVY,
}

Stretch :: enum {
	ULTRA_CONDENSED,
	EXTRA_CONDENSED,
	CONDENSED,
	SEMI_CONDENSED,
	NORMAL,
	SEMI_EXPANDED,
	EXPANDED,
	EXTRA_EXPANDED,
	ULTRA_EXPANDED,
}

Gravity :: enum {
	SOUTH,
	EAST,
	NORTH,
	WEST,
	AUTO,
}

FontMask :: enum {
	FAMILY,
	STYLE,
	VARIANT,
	WEIGHT,
	STRETCH,
	SIZE,
	GRAVITY,
}

Glyph              :: u32;
FontsetForeachFunc :: proc(fontset: ^Fontset, font: ^Font, user_data: g.gpointer) -> g.gboolean;

@(default_calling_convention="c")
foreign pango {
	@(link_name="pango_font_description_new")                      font_description_new                      :: proc() -> ^FontDescription ---;
	@(link_name="pango_font_description_copy")                     font_description_copy                     :: proc(desc: ^FontDescription) -> ^FontDescription ---;
	@(link_name="pango_font_description_copy_static")              font_description_copy_static              :: proc(desc: ^FontDescription) -> ^FontDescription ---;
	@(link_name="pango_font_description_hash")                     font_description_hash                     :: proc(desc: ^FontDescription) -> g.guint ---;
	@(link_name="pango_font_description_equal")                    font_description_equal                    :: proc(desc1, desc2: ^FontDescription) -> g.gboolean ---;
	@(link_name="pango_font_description_free")                     font_description_free                     :: proc(desc: ^FontDescription) ---;
	@(link_name="pango_font_descriptions_free")                    font_descriptions_free                    :: proc(descs: ^^FontDescription, n_descs: i32) ---;
	@(link_name="pango_font_description_set_family")               font_description_set_family               :: proc(desc: ^FontDescription, family: ^byte) ---;
	@(link_name="pango_font_description_set_family_static")        font_description_set_family_static        :: proc(desc: ^FontDescription, family: ^byte) ---;
	@(link_name="pango_font_description_get_family")               font_description_get_family               :: proc(desc: ^FontDescription) -> ^byte ---;
	@(link_name="pango_font_description_set_style")                font_description_set_style                :: proc(desc: ^FontDescription, style: Style) ---;
	@(link_name="pango_font_description_get_style")                font_description_get_style                :: proc(desc: ^FontDescription) -> Style ---;
	@(link_name="pango_font_description_set_variant")              font_description_set_variant              :: proc(desc: ^FontDescription, variant: Variant) ---;
	@(link_name="pango_font_description_get_variant")              font_description_get_variant              :: proc(desc: ^FontDescription) -> Variant ---;
	@(link_name="pango_font_description_set_weight")               font_description_set_weight               :: proc(desc: ^FontDescription, weight: Weight) ---;
	@(link_name="pango_font_description_get_weight")               font_description_get_weight               :: proc(desc: ^FontDescription) -> Weight ---;
	@(link_name="pango_font_description_set_stretch")              font_description_set_stretch              :: proc(desc: ^FontDescription, stretch: Stretch) ---;
	@(link_name="pango_font_description_get_stretch")              font_description_get_stretch              :: proc(desc: ^FontDescription) -> Stretch ---;
	@(link_name="pango_font_description_set_size")                 font_description_set_size                 :: proc(desc: ^FontDescription, size: g.gint) ---;
	@(link_name="pango_font_description_get_size")                 font_description_get_size                 :: proc(desc: ^FontDescription) -> g.gint ---;
	@(link_name="pango_font_description_set_absolute_size")        font_description_set_absolute_size        :: proc(desc: ^FontDescription, size: f64) ---;
	@(link_name="pango_font_description_get_size_is_absolute")     font_description_get_size_is_absolute     :: proc(desc: ^FontDescription) -> g.gboolean ---;
	@(link_name="pango_font_description_set_gravity")              font_description_set_gravity              :: proc(desc: ^FontDescription, gravity: Gravity) ---;
	@(link_name="pango_font_description_get_gravity")              font_description_get_gravity              :: proc(desc: ^FontDescription) -> Gravity ---;
	@(link_name="pango_font_description_get_set_fields")           font_description_get_set_fields           :: proc(desc: ^FontDescription) -> FontMask ---;
	@(link_name="pango_font_description_unset_fields")             font_description_unset_fields             :: proc(desc: ^FontDescription, to_unset: FontMask) ---;
	@(link_name="pango_font_description_merge")                    font_description_merge                    :: proc(desc, desc_to_merge: ^FontDescription, replace_existing: g.gboolean) ---;
	@(link_name="pango_font_description_merge_static")             font_description_merge_static             :: proc(desc, desc_to_merge: ^FontDescription, replace_existing: g.gboolean) ---;
	@(link_name="pango_font_description_better_match")             font_description_better_match             :: proc(desc, old_match, new_match: ^FontDescription) -> g.gboolean ---;
	@(link_name="pango_font_description_from_string")              font_description_from_string              :: proc(str: ^byte) -> ^FontDescription ---;
	@(link_name="pango_font_description_to_string")                font_description_to_string                :: proc(desc: ^FontDescription) -> ^byte ---;
	@(link_name="pango_font_description_to_filename")              font_description_to_filename              :: proc(desc: ^FontDescription) -> ^byte ---;

	@(link_name="pango_font_metrics_ref")                          font_metrics_ref                          :: proc(metrics: ^FontMetrics) -> ^FontMetrics ---;
	@(link_name="pango_font_metrics_unref")                        font_metrics_unref                        :: proc(metrics: ^FontMetrics) ---;
	@(link_name="pango_font_metrics_get_ascent")                   font_metrics_get_ascent                   :: proc(metrics: ^FontMetrics) -> i32 ---;
	@(link_name="pango_font_metrics_get_descent")                  font_metrics_get_descent                  :: proc(metrics: ^FontMetrics) -> i32 ---;
	@(link_name="pango_font_metrics_get_approximate_char_width")   font_metrics_get_approximate_char_width   :: proc(metrics: ^FontMetrics) -> i32 ---;
	@(link_name="pango_font_metrics_get_approximate_digit_width")  font_metrics_get_approximate_digit_width  :: proc(metrics: ^FontMetrics) -> i32 ---;
	@(link_name="pango_font_metrics_get_underline_thickness")      font_metrics_get_underline_thickness      :: proc(metrics: ^FontMetrics) -> i32 ---;
	@(link_name="pango_font_metrics_get_underline_position")       font_metrics_get_underline_position       :: proc(metrics: ^FontMetrics) -> i32 ---;
	@(link_name="pango_font_metrics_get_strikethrough_thickness")  font_metrics_get_strikethrough_thickness  :: proc(metrics: ^FontMetrics) -> i32 ---;
	@(link_name="pango_font_metrics_get_strikethrough_position")   font_metrics_get_strikethrough_position   :: proc(metrics: ^FontMetrics) -> i32 ---;

	@(link_name="pango_font_find_shaper")                          font_find_shaper                          :: proc(font: ^Font, language: ^Language, ch: u32) -> ^EngineShape ---;
	@(link_name="pango_font_describe")                             font_describe                             :: proc(font: ^Font) -> ^FontDescription ---;
	@(link_name="pango_font_describe_with_absolute_size")          font_describe_with_absolute_size          :: proc(font: ^Font) -> ^FontDescription ---;
	@(link_name="pango_font_get_coverage")                         font_get_coverage                         :: proc(font: ^Font, language: ^Language) -> ^Coverage ---;
	@(link_name="pango_font_get_glyph_extents")                    font_get_glyph_extents                    :: proc(font: ^Font, glyph: Glyph, ink_rect, logical_rect: ^Rectangle) ---;
	@(link_name="pango_font_get_metrics")                          font_get_metrics                          :: proc(font: ^Font, language: ^Language) -> ^FontMetrics ---;
	@(link_name="pango_font_get_font_map")                         font_get_font_map                         :: proc(font: ^Font) -> ^FontMap ---;

	@(link_name="pango_font_family_get_name")                      font_family_get_name                      :: proc(family: ^FontFamily) -> ^byte ---;
	@(link_name="pango_font_family_is_monospace")                  font_family_is_monospace                  :: proc(family: ^FontFamily) -> g.gboolean ---;
	@(link_name="pango_font_family_list_faces")                    font_family_list_faces                    :: proc(family: ^FontFamily, faces: ^^^FontFace, n_faces: ^i32) ---;

	@(link_name="pango_font_face_get_face_name")                   font_face_get_face_name                   :: proc(face: ^FontFace) -> ^byte ---;
	@(link_name="pango_font_face_list_sizes")                      font_face_list_sizes                      :: proc(face: ^FontFace, sizes: ^^i32, n_sizes: ^i32) ---;
	@(link_name="pango_font_face_describe")                        font_face_describe                        :: proc(face: ^FontFace) -> ^FontDescription ---;
	@(link_name="pango_font_face_is_synthesized")                  font_face_is_synthesized                  :: proc(face: ^FontFace) -> g.gboolean ---;

	@(link_name="pango_font_map_create_context")                   font_map_create_context                   :: proc(fontmap: ^FontMap) -> ^Context ---;
	@(link_name="pango_font_map_load_font")                        font_map_load_font                        :: proc(fontmap: ^FontMap, ctx: ^Context, desc: ^FontDescription) -> ^Font ---;
	@(link_name="pango_font_map_load_fontset")                     font_map_load_fontset                     :: proc(fontmap: ^FontMap, ctx: ^Context, desc: ^FontDescription, language: ^Language) -> ^Fontset ---;
	@(link_name="pango_font_map_list_families")                    font_map_list_families                    :: proc(fontmap: ^FontMap, families: ^^^FontFamily, n_families: ^i32) ---;
	@(link_name="pango_font_map_get_shape_engine_type")            font_map_get_shape_engine_type            :: proc(fontmap: ^FontMap) -> ^byte ---;
	@(link_name="pango_font_map_get_serial")                       font_map_get_serial                       :: proc(fontmap: ^FontMap) -> g.guint ---;
	@(link_name="pango_font_map_changed")                          font_map_changed                          :: proc(fontmap: ^FontMap) ---;

	@(link_name="pango_fontset_get_font")                          fontset_get_font                          :: proc(fontset: ^Fontset, wc: g.guint) -> ^Font ---;
	@(link_name="pango_fontset_get_metrics")                       fontset_get_metrics                       :: proc(fontset: ^Fontset) -> ^FontMetrics ---;
	@(link_name="PangoFontsetForeachFunc")                         fontset_foreach_func                      :: proc(fontset: ^Fontset, font: ^Font, user_data: g.gpointer) -> g.gboolean ---;
	@(link_name="pango_fontset_foreach")                           fontset_foreach                           :: proc(fontset: ^Fontset, func: FontsetForeachFunc, data: g.gpointer) ---;

	@(link_name="pango_fontset_simple_new")                        fontset_simple_new                        :: proc(language: ^Language) -> ^FontsetSimple ---;
	@(link_name="pango_fontset_simple_append")                     fontset_simple_append                     :: proc(fontset: ^FontsetSimple, font: ^Font) ---;
	@(link_name="pango_fontset_simple_size")                       fontset_simple_size                       :: proc(fontset: ^FontsetSimple) -> i32 ---;
}

