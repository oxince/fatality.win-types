---@meta

-- Global Functions
---@param ... any Values to print in the console.
function print(...) end

---@param text string Error text
function error(text) end

-- Globals
---@class events
---@field present_queue event_t
---@field frame_stage_notify event_t
---@field render_start_pre event_t
---@field render_start_post event_t
---@field setup_view_pre event_t
---@field setup_view_post event_t
---@field override_view event_t
---@field event event_t
---@field handle_input event_t
---@field input event_t
events = {}

---@class event_t
local event_t = {}

---@param fn function Callback function
function event_t:add(fn) end

---@param fn function Callback function to remove
function event_t:remove(fn) end

-- Math
---@class math
math = {}

---@param src vector Source vector
---@param dst vector Destination vector
---@return vector
function math.calc_angle(src, dst) end

---@param angle number Input angle
---@return number
function math.angle_normalize(angle) end

---@param from vector Start angle
---@param to vector End angle
---@param speed number Approach speed
---@return vector
function math.approach_angles(from, to, speed) end

---@param mins vector Box mins
---@param maxs vector Box maxs
---@param dir vector Point direction
---@param radius number Area radius
---@return vector
function math.edge_point(mins, maxs, dir, radius) end

---@param t1 number Start value
---@param t2 number End value
---@param progress number Interpolation amount
---@return number
function math.lerp(t1, t2, progress) end

---@param forward vector Source vector
---@param up? vector Up vector
---@return vector
function math.vector_angles(forward, up) end

---@param xyz vector Point in world
---@param round? boolean Whether to round output
---@return draw.vec2
function math.world_to_screen(xyz, round) end

---@param n number Value
---@param lower number Lowest value
---@param upper number Highest value
---@return number
function math.clamp(n, lower, upper) end

---@param val number Value
---@param a number Lowest source value
---@param b number Highest source value
---@param c number Lowest destination value
---@param d number Highest destination value
---@return number
function math.remap_val(val, a, b, c, d) end

---@param val number Value
---@param a number Lowest source value
---@param b number Highest source value
---@param c number Lowest destination value
---@param d number Highest destination value
---@return number
function math.remap_val_clamped(val, a, b, c, d) end

---@param x number X coordinate
---@param y number Y coordinate
---@return draw.vec2
function math.vec2(x, y) end

---@param x number X coordinate
---@param y number Y coordinate
---@param z number Z coordinate
---@return vector
function math.vec3(x, y, z) end

-- Game
---@class game
---@field global_vars global_vars_t
---@field engine cengine_client
---@field input ccsgo_input
---@field input_system cinput_system
---@field game_ui_funcs cgame_ui_funcs
---@field cvar ccvar
game = {}

---@class global_vars_t
---@field real_time number Time since game start
---@field frame_count integer Frame count
---@field abs_frame_time number Absolute frame time
---@field max_clients integer Max clients
---@field ticks_this_frame integer Ticks this frame
---@field frame_time number Frame time
---@field cur_time number Current time
---@field tick_fraction number Tick fraction
---@field tick_count integer Tick count
---@field map_path string Map path
---@field map_name string Map name
local global_vars_t = {}

---@class cengine_client
local cengine_client = {}

---@return number
function cengine_client:get_last_timestamp() end

---@return integer
function cengine_client:get_last_server_tick() end

---@return boolean
function cengine_client:in_game() end

---@return boolean
function cengine_client:is_connected() end

---@return cnet_chan?
function cengine_client:get_netchan() end

---@param cmd string Command to execute
---@param unrestricted? boolean Preserve restrictions
function cengine_client:client_cmd(cmd, unrestricted) end

---@return integer, integer
function cengine_client:get_screen_size() end

---@class cnet_chan
local cnet_chan = {}

---@return string?
function cnet_chan:get_address() end

---@return boolean?
function cnet_chan:is_loopback() end

---@return boolean
function cnet_chan:is_null() end

---@return number?
function cnet_chan:get_latency() end

---@class ccsgo_input
---@field in_third_person boolean
local ccsgo_input = {}

---@return vector
function ccsgo_input:get_view_angles() end

---@param ang vector
function ccsgo_input:set_view_angles(ang) end

---@class cinput_system
local cinput_system = {}

---@param vk integer Virtual key
---@return integer
function cinput_system:vk_to_button_code(vk) end

---@class cgame_ui_funcs
local cgame_ui_funcs = {}

---@param code integer Button code
---@return string
function cgame_ui_funcs:get_binding_for_button_code(code) end

---@class ccvar
local ccvar = {}

---@param name string Var name
---@return convar
function ccvar:find(name) end

---@class convar
---@field name string
---@field description string
---@field flags integer
---@field value any
local convar = {}

-- Mods
---@class mods
---@field events events_t
mods = {}

---@class events_t
local events_t = {}

---@param name string Event name
function events_t:add_listener(name) end

-- Draw
---@class draw
---@field adapter draw.adapter
---@field frame_time number
---@field time number
---@field scale number
---@field display draw.vec2
---@field textures draw.accessor_texture
---@field fonts draw.accessor_font
---@field shaders draw.accessor_shader
---@field surface draw.layer
draw = {}

---@class draw.adapter
local draw_adapter = {}

---@return ptr
function draw_adapter:get_back_buffer() end

---@return ptr
function draw_adapter:get_back_buffer_downsampled() end

---@return ptr
function draw_adapter:get_shared_texture() end

-- Draw Types
---@class draw.vec2
---@field x number
---@field y number
local draw_vec2 = {}

---@overload fun(): draw.vec2
---@overload fun(value: number): draw.vec2
---@overload fun(x: number, y: number): draw.vec2
---@param x? number
---@param y? number
---@return draw.vec2
function draw.vec2(x, y) end

---@return draw.vec2
function draw_vec2:floor() end

---@return draw.vec2
function draw_vec2:ceil() end

---@return draw.vec2
function draw_vec2:round() end

---@return number
function draw_vec2:len() end

---@return number
function draw_vec2:len_sqr() end

---@param other draw.vec2
---@return number
function draw_vec2:dist(other) end

---@param other draw.vec2
---@return number
function draw_vec2:dist_sqr(other) end

---@class draw.rect
---@field mins draw.vec2
---@field maxs draw.vec2
local draw_rect = {}

---@overload fun(): draw.rect
---@overload fun(value: number): draw.rect
---@overload fun(value: draw.vec2): draw.rect
---@overload fun(x: number, y: number): draw.rect
---@overload fun(mins: draw.vec2, maxs: draw.vec2): draw.rect
---@overload fun(x0: number, y0: number, x1: number, y1: number): draw.rect
---@param x0? number
---@param y0? number
---@param x1? number
---@param y1? number
---@return draw.rect
function draw.rect(x0, y0, x1, y1) end

---@overload fun(): number
---@overload fun(value: number): draw.rect
---@param value? number
---@return number|draw.rect
function draw_rect:width(value) end

---@overload fun(): number
---@overload fun(value: number): draw.rect
---@param value? number
---@return number|draw.rect
function draw_rect:height(value) end

---@overload fun(): draw.vec2
---@overload fun(value: draw.vec2): draw.rect
---@param value? draw.vec2
---@return draw.vec2|draw.rect
function draw_rect:size(value) end

---@param value draw.vec2
---@return draw.rect
function draw_rect:explode(value) end

---@return draw.rect
function draw_rect:half_width() end

---@param value draw.vec2
---@return draw.rect
function draw_rect:translate(value) end

---@param value number
---@return draw.rect
function draw_rect:margin_left(value) end

---@param value number
---@return draw.rect
function draw_rect:margin_right(value) end

---@param value number
---@return draw.rect
function draw_rect:margin_top(value) end

---@param value number
---@return draw.rect
function draw_rect:margin_bottom(value) end

---@param value number
---@return draw.rect
function draw_rect:padding_left(value) end

---@param value number
---@return draw.rect
function draw_rect:padding_right(value) end

---@param value number
---@return draw.rect
function draw_rect:padding_top(value) end

---@param value number
---@return draw.rect
function draw_rect:padding_bottom(value) end

---@param value number
---@return draw.rect
function draw_rect:shrink(value) end

---@param value number
---@return draw.rect
function draw_rect:expand(value) end

---@overload fun(other: draw.vec2): boolean
---@overload fun(other: draw.rect): boolean
---@param other draw.vec2|draw.rect
---@return boolean
function draw_rect:contains(other) end

---@param other draw.rect
---@return boolean
function draw_rect:overlaps(other) end

---@param other draw.rect
---@return draw.rect
function draw_rect:intersect(other) end

---@return draw.vec2
function draw_rect:tl() end

---@return draw.vec2
function draw_rect:tr() end

---@return draw.vec2
function draw_rect:br() end

---@return draw.vec2
function draw_rect:bl() end

---@return draw.vec2
function draw_rect:center() end

---@param r number
---@return draw.vec2
function draw_rect:circle(r) end

---@return draw.rect
function draw_rect:floor() end

---@return draw.rect
function draw_rect:ceil() end

---@return draw.rect
function draw_rect:round() end

---@return boolean
function draw_rect:is_zero() end

---@class draw.color
local draw_color = {}

---@overload fun(): draw.color
---@overload fun(r: integer, g: integer, b: integer, a?: integer): draw.color
---@overload fun(hex: string): draw.color
---@param r? integer
---@param g? integer
---@param b? integer
---@param a? integer
---@return draw.color
function draw.color(r, g, b, a) end

---@return draw.color
function draw.color.white() end

---@return draw.color
function draw.color.white_transparent() end

---@return draw.color
function draw.color.black() end

---@return draw.color
function draw.color.black_transparent() end

---@param p number Percentile 0-1
---@param a? number Opacity
---@return draw.color
function draw.color.percent(p, a) end

---@param b number Percentile 0-1
---@param a? number Opacity
---@return draw.color
function draw.color.gray(b, a) end

---@param a draw.color
---@param b draw.color
---@param t number
---@return draw.color
function draw.color.interpolate(a, b, t) end

---@return integer
function draw_color:rgba() end

---@return integer
function draw_color:argb() end

---@return integer
function draw_color:bgra() end

---@return integer
function draw_color:abgr() end

---@param value number
---@return draw.color
function draw_color:darken(value) end

---@overload fun(value: number): draw.color
---@overload fun(value: integer): draw.color
---@param value number|integer
---@return draw.color
function draw_color:mod_a(value) end

---@param value number
---@return draw.color
function draw_color:r(value) end

---@param value number
---@return draw.color
function draw_color:g(value) end

---@param value number
---@return draw.color
function draw_color:b(value) end

---@param value number
---@return draw.color
function draw_color:a(value) end

---@return integer
function draw_color:get_r() end

---@return integer
function draw_color:get_g() end

---@return integer
function draw_color:get_b() end

---@return integer
function draw_color:get_a() end

---@return integer
function draw_color:h() end

---@return number
function draw_color:s() end

---@return number
function draw_color:v() end

---@param hue integer
---@param saturation number
---@param brightness number
---@param alpha? number
---@return draw.color
function draw_color:hsv(hue, saturation, brightness, alpha) end

---@class draw.accessor_texture
local draw_accessor_texture = {}

---@param key string
---@return draw.texture
function draw_accessor_texture:__index(key) end

---@param key string
---@param obj draw.texture
function draw_accessor_texture:__newindex(key, obj) end

---@class draw.accessor_font
local draw_accessor_font = {}

---@param key string
---@return draw.font_base
function draw_accessor_font:__index(key) end

---@param key string
---@param obj draw.font_base
function draw_accessor_font:__newindex(key, obj) end

---@class draw.accessor_shader
local draw_accessor_shader = {}

---@param key string
---@return draw.shader
function draw_accessor_shader:__index(key) end

---@param key string
---@param obj draw.shader
function draw_accessor_shader:__newindex(key, obj) end

-- Draw Layer
---@class draw.layer
---@field g draw.command
---@field font draw.font_base?
---@field tex_sz draw.vec2?
---@field skip_dpi boolean
local draw_layer = {}

---@param a draw.vec2
---@param b draw.vec2
---@param c draw.vec2
---@param col draw.color
function draw_layer:add_triangle_filled(a, b, c, col) end

---@param tl draw.vec2
---@param tr draw.vec2
---@param br draw.vec2
---@param bl draw.vec2
---@param col draw.color
function draw_layer:add_quad_filled(tl, tr, br, bl, col) end

---@param r draw.rect
---@param col draw.color
function draw_layer:add_rect_filled(r, col) end

---@param center draw.vec2
---@param radius number
---@param c draw.color
---@param segments? integer
---@param fill? number
function draw_layer:add_circle_filled(center, radius, c, segments, fill) end

---@param a draw.vec2
---@param b draw.vec2
---@param c draw.vec2
---@param cols draw.color[]
function draw_layer:add_triangle_filled_multicolor(a, b, c, cols) end

---@param r draw.rect
---@param cols draw.color[]
function draw_layer:add_rect_filled_multicolor(r, cols) end

---@param center draw.vec2
---@param radius number
---@param cols draw.color[]
---@param segments? integer
---@param fill? number
function draw_layer:add_circle_filled_multicolor(center, radius, cols, segments, fill) end

---@param tl draw.vec2
---@param tr draw.vec2
---@param br draw.vec2
---@param bl draw.vec2
---@param cols draw.color[]
function draw_layer:add_quad_filled_multicolor(tl, tr, br, bl, cols) end

---@param mins draw.vec2
---@param maxs draw.vec2
---@param radius_min number
---@param radius_max number
---@param cols draw.color[]
---@param segments? integer
function draw_layer:add_pill_multicolor(mins, maxs, radius_min, radius_max, cols, segments) end

---@param r draw.rect
---@param dir draw.shadow_dir
---@param a? number
function draw_layer:add_shadow_line(r, dir, a) end

---@param r draw.rect
---@param radius number
---@param bg? boolean
---@param a? number
function draw_layer:add_shadow_rect(r, radius, bg, a) end

---@param r draw.rect
---@param radius number
---@param c draw.color
---@param parts? draw.glow_parts
function draw_layer:add_glow(r, radius, c, parts) end

---@param r draw.rect
---@param c draw.color
---@param amount number
---@param rnd? draw.rounding
function draw_layer:add_rect_filled_rounded(r, c, amount, rnd) end

---@param r draw.rect
---@param c draw.color[]
---@param amount number
---@param rnd? draw.rounding
function draw_layer:add_rect_filled_rounded_multicolor(r, c, amount, rnd) end

---@param a draw.vec2
---@param b draw.vec2
---@param c draw.vec2
---@param col draw.color
---@param thickness? number
---@param mode? draw.outline_mode
function draw_layer:add_triangle(a, b, c, col, thickness, mode) end

---@param tl draw.vec2
---@param tr draw.vec2
---@param br draw.vec2
---@param bl draw.vec2
---@param c draw.color
---@param thickness? number
---@param mode? draw.outline_mode
function draw_layer:add_quad(tl, tr, br, bl, c, thickness, mode) end

---@param r draw.rect
---@param c draw.color
---@param thickness? number
---@param mode? draw.outline_mode
function draw_layer:add_rect(r, c, thickness, mode) end

---@param center draw.vec2
---@param radius number
---@param c draw.color
---@param segments? integer
---@param fill? number
---@param thickness? number
---@param mode? draw.outline_mode
function draw_layer:add_circle(center, radius, c, segments, fill, thickness, mode) end

---@param a draw.vec2
---@param b draw.vec2
---@param c draw.color
---@param thickness? number
function draw_layer:add_line(a, b, c, thickness) end

---@param a draw.vec2
---@param b draw.vec2
---@param c draw.color
---@param c2 draw.color
---@param thickness? number
function draw_layer:add_line_multicolor(a, b, c, c2, thickness) end

---@param r draw.rect
---@param c draw.color
---@param amount number
---@param rnd? draw.rounding
---@param thickness? number
---@param mode? draw.outline_mode
function draw_layer:add_rect_rounded(r, c, amount, rnd, thickness, mode) end

---@param p draw.vec2
---@param text string
---@param c draw.color
---@param params? draw.text_params
function draw_layer:add_text(p, text, c, params) end

---@param r draw.rect?
---@param intersect? boolean
function draw_layer:override_clip_rect(r, intersect) end

-- Draw Enums
---@class draw.outline_mode
---@field inset integer
---@field outset integer
---@field center integer
draw.outline_mode = {}

---@class draw.rounding
---@field tl integer
---@field tr integer
---@field bl integer
---@field br integer
---@field t integer
---@field l integer
---@field r integer
---@field b integer
---@field all integer
draw.rounding = {}

---@class draw.glow_parts
---@field tl integer
---@field tr integer
---@field bl integer
---@field br integer
---@field t integer
---@field l integer
---@field r integer
---@field b integer
---@field all_left integer
---@field all_right integer
---@field all_top integer
---@field all_bottom integer
---@field all integer
---@field no_bottom integer
---@field no_top integer
---@field no_right integer
---@field no_left integer
draw.glow_parts = {}

---@class draw.text_params
local draw_text_params = {}

---@param v draw.text_alignment
---@return draw.text_params
function draw.text_params.with_v(v) end

---@param h draw.text_alignment
---@return draw.text_params
function draw.text_params.with_h(h) end

---@param line draw.text_alignment
---@return draw.text_params
function draw.text_params.with_line(line) end

---@param v draw.text_alignment
---@param h draw.text_alignment
---@return draw.text_params
function draw.text_params.with_vh(v, h) end

---@param v draw.text_alignment
---@param line draw.text_alignment
---@return draw.text_params
function draw.text_params.with_vline(v, line) end

---@param h draw.text_alignment
---@param line draw.text_alignment
---@return draw.text_params
function draw.text_params.with_hline(h, line) end

---@param v draw.text_alignment
---@param h draw.text_alignment
---@param line draw.text_alignment
---@return draw.text_params
function draw.text_params.with_vhline(v, h, line) end

---@class draw.text_alignment
---@field left integer
---@field center integer
---@field right integer
---@field top integer
---@field bottom integer
draw.text_alignment = {}

---@class draw.shadow_dir
---@field up integer
---@field down integer
---@field left integer
---@field right integer
draw.shadow_dir = {}

---@class draw.command
---@field texture ptr
---@field frag_shader ptr
---@field clip_rect draw.rect?
---@field uv_rect draw.rect?
---@field alpha number
---@field rotation number
---@field anti_alias boolean
---@field ignore_scaling boolean
---@field chained_call boolean
---@field only_downsampled boolean
---@field capture_back_buffer boolean
---@field is_tile boolean
---@field mode draw.render_mode
local draw_command = {}

---@param tex draw.texture
function draw_command:set_texture(tex) end

---@param sh draw.shader
function draw_command:set_shader(sh) end

---@class draw.render_mode
---@field normal integer
---@field wireframe integer
draw.render_mode = {}

-- Draw Managed Objects
---@class draw.managed
---@field obj ptr?
local draw_managed = {}

function draw_managed:create() end

function draw_managed:destroy() end

---@class draw.texture: draw.managed
---@field is_animated boolean
local draw_texture = {}

---@overload fun(path: string): draw.texture
---@overload fun(data: ptr, sz: integer): draw.texture
---@overload fun(data: ptr, w: integer, h: integer, p: integer): draw.texture
---@param path_or_data string|ptr
---@param sz_or_w? integer
---@param h? integer
---@param p? integer
---@return draw.texture
function draw.texture(path_or_data, sz_or_w, h, p) end

---@return draw.vec2
function draw_texture:get_size() end

---@class draw.svg_texture: draw.texture
local draw_svg_texture = {}

---@param sv string SVG text
---@param h? number Target height
---@return draw.svg_texture
function draw.svg_texture(sv, h) end

---@class draw.animated_texture: draw.texture
---@field should_loop boolean
local draw_animated_texture = {}

---@overload fun(path: string): draw.animated_texture
---@overload fun(data: ptr, sz: integer): draw.animated_texture
---@param path_or_data string|ptr
---@param sz? integer
---@return draw.animated_texture
function draw.animated_texture(path_or_data, sz) end

function draw_animated_texture:reset_loop() end

---@param frame integer
function draw_animated_texture:set_frame(frame) end

---@return integer
function draw_animated_texture:get_frame_count() end

---@class draw.shader: draw.managed
local draw_shader = {}

---@param src string Shader source
---@return draw.shader
function draw.shader(src) end

---@class draw.font_base: draw.managed
---@field height number
---@field ascent number
---@field descent number
---@field line_gap number
---@field kerning_gap number
---@field outline_alpha number
---@field flags draw.font_flags
---@field y_offset integer
---@field x_offset integer
---@field fallback_font draw.font_base?
---@field dropshadow_color draw.color
local draw_font_base = {}

---@param left integer
---@param right integer
---@return number
function draw_font_base:get_kerned_char_width(left, right) end

---@param cp integer
---@return number
function draw_font_base:get_kerning(cp) end

---@param text string
---@param skip_scaling? boolean
---@param til_newline? boolean
---@return draw.vec2
function draw_font_base:get_text_size(text, skip_scaling, til_newline) end

---@param text string
---@param width number
---@return string
function draw_font_base:wrap_text(text, width) end

---@param codepoint integer
---@return draw.glyph_t
function draw_font_base:get_glyph(codepoint) end

---@param gl draw.glyph_t
---@return integer?
function draw_font_base:get_texture(gl) end

---@class draw.font: draw.font_base
local draw_font = {}

---@overload fun(path: string, size: number, fl?: draw.font_flags, mi?: integer, ma?: integer): draw.font
---@overload fun(mem: ptr, sz: integer, size: number, fl?: draw.font_flags, mi?: integer, ma?: integer): draw.font
---@overload fun(mem: ptr, sz: integer, size: number, fl: draw.font_flags, pairs: table): draw.font
---@param path_or_mem string|ptr
---@param size_or_sz number|integer
---@param size_or_size? number
---@param fl? draw.font_flags
---@param mi_or_pairs? integer|table
---@param ma? integer
---@return draw.font
function draw.font(path_or_mem, size_or_sz, size_or_size, fl, mi_or_pairs, ma) end

---@class draw.font_gdi: draw.font_base
local draw_font_gdi = {}

---@param name string Font name
---@param size number Font height
---@param fl? draw.font_flags
---@param mi? integer
---@param ma? integer
---@param weight? integer
---@return draw.font_gdi
function draw.font_gdi(name, size, fl, mi, ma, weight) end

---@class draw.glyph_t
---@field codepoint integer
---@field size draw.vec2
---@field offset draw.vec2
---@field uv draw.rect
local draw_glyph_t = {}

---@class draw.font_flags
---@field shadow integer
---@field outline integer
---@field anti_alias integer
---@field no_dpi integer
---@field no_kern integer
---@field mono integer
---@field light integer
draw.font_flags = {}

-- Entities
---@class entities
---@field players entity_list_t_player_pawn
---@field controllers entity_list_t_player_controller
---@field items entity_list_t_weapon_base
---@field dropped_items entity_list_t_weapon_base
---@field projectiles entity_list_t_grenade_projectile
entities = {}

---@return cs2_player_pawn?
function entities.get_local_pawn() end

---@return cs2_player_controller?
function entities.get_local_controller() end

---@class entity_list_t_player_pawn
local entity_list_t_player_pawn = {}

---@param fn fun(entry: entity_entry_t_player_pawn)
function entity_list_t_player_pawn:for_each(fn) end

---@param fn fun(entry: entity_entry_t_player_pawn)
function entity_list_t_player_pawn:for_each_z(fn) end

---@class entity_list_t_player_controller
local entity_list_t_player_controller = {}

---@param fn fun(entry: entity_entry_t_player_controller)
function entity_list_t_player_controller:for_each(fn) end

---@param fn fun(entry: entity_entry_t_player_controller)
function entity_list_t_player_controller:for_each_z(fn) end

---@class entity_list_t_weapon_base
local entity_list_t_weapon_base = {}

---@param fn fun(entry: entity_entry_t_weapon_base)
function entity_list_t_weapon_base:for_each(fn) end

---@param fn fun(entry: entity_entry_t_weapon_base)
function entity_list_t_weapon_base:for_each_z(fn) end

---@class entity_list_t_grenade_projectile
local entity_list_t_grenade_projectile = {}

---@param fn fun(entry: entity_entry_t_grenade_projectile)
function entity_list_t_grenade_projectile:for_each(fn) end

---@param fn fun(entry: entity_entry_t_grenade_projectile)
function entity_list_t_grenade_projectile:for_each_z(fn) end

---@class entity_entry_t_player_pawn
---@field entity cs2_player_pawn
---@field had_dataupdate boolean
---@field handle chandle_player_pawn
local entity_entry_t_player_pawn = {}

---@class entity_entry_t_player_controller
---@field entity cs2_player_controller
---@field had_dataupdate boolean
---@field handle chandle_player_controller
---@field avatar draw.texture?
local entity_entry_t_player_controller = {}

---@class entity_entry_t_weapon_base
---@field entity cs2_weapon_base
---@field had_dataupdate boolean
---@field handle chandle_weapon_base
local entity_entry_t_weapon_base = {}

---@class entity_entry_t_grenade_projectile
---@field entity cs2_grenade_projectile
---@field had_dataupdate boolean
---@field handle chandle_grenade_projectile
local entity_entry_t_grenade_projectile = {}

-- Base Entity
---@class base_entity
local base_entity = {}

---@param name string Field name
---@return schema_accessor_t
function base_entity:__index(name) end

---@return string?
function base_entity:get_class_name() end

---@return cs2_weapon_base_gun?
function base_entity:to_weapon_base_gun() end

---@return cs2_weapon_base?
function base_entity:to_weapon_base() end

---@return cs2_player_pawn?
function base_entity:to_player_pawn() end

---@return cs2_player_controller?
function base_entity:to_player_controller() end

---@class schema_accessor_t
local schema_accessor_t = {}

---@return any
function schema_accessor_t:get() end

---@param value any
function schema_accessor_t:set(value) end

-- Entity Types
---@class cs2_weapon_base_gun: base_entity
local cs2_weapon_base_gun = {}

---@return vector
function cs2_weapon_base_gun:get_abs_origin() end

---@return number
function cs2_weapon_base_gun:get_max_speed() end

---@param mode csweapon_mode
---@return number
function cs2_weapon_base_gun:get_inaccuracy(mode) end

---@param mode csweapon_mode
---@return number
function cs2_weapon_base_gun:get_spread(mode) end

---@return weapon_id
function cs2_weapon_base_gun:get_id() end

---@return csweapon_type
function cs2_weapon_base_gun:get_type() end

---@return ccsweapon_base_vdata
function cs2_weapon_base_gun:get_data() end

---@return boolean
function cs2_weapon_base_gun:is_gun() end

---@return boolean
function cs2_weapon_base_gun:is_attackable() end

---@return boolean
function cs2_weapon_base_gun:has_secondary_attack() end

---@return boolean
function cs2_weapon_base_gun:has_spread() end

---@class cs2_player_pawn: base_entity
local cs2_player_pawn = {}

---@return boolean
function cs2_player_pawn:should_draw() end

---@return boolean
function cs2_player_pawn:is_left_handed() end

---@return vector
function cs2_player_pawn:get_abs_origin() end

---@return vector
function cs2_player_pawn:get_abs_angles() end

---@return vector
function cs2_player_pawn:get_abs_velocity() end

---@param vec vector
function cs2_player_pawn:set_abs_origin(vec) end

---@param ang vector
function cs2_player_pawn:set_abs_angles(ang) end

---@param vel vector
function cs2_player_pawn:set_abs_velocity(vel) end

---@return boolean
function cs2_player_pawn:is_alive() end

---@return boolean
function cs2_player_pawn:is_enemy() end

---@param ent base_entity
---@return boolean
function cs2_player_pawn:is_enemy_to(ent) end

---@return cs2_weapon_base_gun?
function cs2_player_pawn:get_active_weapon() end

---@return string
function cs2_player_pawn:get_name() end

---@return vector
function cs2_player_pawn:get_view_offset() end

---@return vector
function cs2_player_pawn:get_eye_pos() end

---@class cs2_player_controller: base_entity
local cs2_player_controller = {}

---@return boolean
function cs2_player_controller:is_enemy() end

---@return string
function cs2_player_controller:get_name() end

---@return cs2_player_pawn?
function cs2_player_controller:get_pawn() end

---@return cs2_weapon_base_gun?
function cs2_player_controller:get_active_weapon() end

---@return base_entity?
function cs2_player_controller:get_observer_pawn() end

---@return base_entity?
function cs2_player_controller:get_observer_target() end

---@return observer_mode_t
function cs2_player_controller:get_observer_mode() end

---@class cs2_weapon_base: base_entity
local cs2_weapon_base = {}

---@return vector
function cs2_weapon_base:get_abs_origin() end

---@return weapon_id
function cs2_weapon_base:get_id() end

---@return csweapon_type
function cs2_weapon_base:get_type() end

---@return ccsweapon_base_vdata
function cs2_weapon_base:get_data() end

---@class cs2_grenade_projectile: base_entity
local cs2_grenade_projectile = {}

---@return vector
function cs2_grenade_projectile:get_abs_origin() end

---@return integer
function cs2_grenade_projectile:get_grenade_type() end

---@class ccsweapon_base_vdata
local ccsweapon_base_vdata = {}

---@param name string Field name
---@return schema_accessor_t
function ccsweapon_base_vdata:__index(name) end

---@class cfiring_mode
---@field values_arr any
local cfiring_mode = {}

---@class chandle_player_pawn
local chandle_player_pawn = {}

---@return cs2_player_pawn?
function chandle_player_pawn:get() end

---@return boolean
function chandle_player_pawn:valid() end

---@return boolean
function chandle_player_pawn:is_clientside() end

---@class chandle_player_controller
local chandle_player_controller = {}

---@return cs2_player_controller?
function chandle_player_controller:get() end

---@return boolean
function chandle_player_controller:valid() end

---@return boolean
function chandle_player_controller:is_clientside() end

---@class chandle_weapon_base
local chandle_weapon_base = {}

---@return cs2_weapon_base?
function chandle_weapon_base:get() end

---@return boolean
function chandle_weapon_base:valid() end

---@return boolean
function chandle_weapon_base:is_clientside() end

---@class chandle_grenade_projectile
local chandle_grenade_projectile = {}

---@return cs2_grenade_projectile?
function chandle_grenade_projectile:get() end

---@return boolean
function chandle_grenade_projectile:valid() end

---@return boolean
function chandle_grenade_projectile:is_clientside() end

-- Enums
---@alias csweapon_mode
---|'"primary_mode"'
---|'"secondary_mode"'

---@alias csweapon_type
---|'"knife"'
---|'"pistol"'
---|'"submachinegun"'
---|'"rifle"'
---|'"shotgun"'
---|'"sniper_rifle"'
---|'"machinegun"'
---|'"c4"'
---|'"taser"'
---|'"grenade"'
---|'"stackableitem"'
---|'"fists"'
---|'"breachcharge"'
---|'"bumpmine"'
---|'"tablet"'
---|'"melee"'
---|'"shield"'
---|'"zone_repulsor"'
---|'"unknown"'

---@alias weapon_id
---|'"none"'
---|'"deagle"'
---|'"elite"'
---|'"fiveseven"'
---|'"glock"'
---|'"ak47"'
---|'"aug"'
---|'"awp"'
---|'"famas"'
---|'"g3sg1"'
---|'"galilar"'
---|'"m249"'
---|'"m4a1"'
---|'"mac10"'
---|'"p90"'
---|'"zone_repulsor"'
---|'"mp5sd"'
---|'"ump45"'
---|'"xm1014"'
---|'"bizon"'
---|'"mag7"'
---|'"negev"'
---|'"sawedoff"'
---|'"tec9"'
---|'"taser"'
---|'"hkp2000"'
---|'"mp7"'
---|'"mp9"'
---|'"nova"'
---|'"p250"'
---|'"shield"'
---|'"scar20"'
---|'"sg556"'
---|'"ssg08"'
---|'"knifegg"'
---|'"knife"'
---|'"flashbang"'
---|'"hegrenade"'
---|'"smokegrenade"'
---|'"molotov"'
---|'"decoy"'
---|'"incgrenade"'
---|'"c4"'
---|'"healthshot"'
---|'"knife_t"'
---|'"m4a1_silencer"'
---|'"usp_silencer"'
---|'"cz75a"'
---|'"revolver"'
---|'"tagrenade"'
---|'"fists"'
---|'"breachcharge"'
---|'"tablet"'
---|'"melee"'
---|'"axe"'
---|'"hammer"'
---|'"spanner"'
---|'"knife_ghost"'
---|'"firebomb"'
---|'"diversion"'
---|'"fraggrenade"'
---|'"snowball"'
---|'"bumpmine"'
---|'"knife_bayonet"'
---|'"knife_css"'
---|'"knife_flip"'
---|'"knife_gut"'
---|'"knife_karambit"'
---|'"knife_m9bayonet"'
---|'"knife_tactical"'
---|'"knife_falchion"'
---|'"knife_survival_bowie"'
---|'"knife_butterfly"'
---|'"knife_push"'
---|'"knife_cord"'
---|'"knife_canis"'
---|'"knife_ursus"'
---|'"knife_gypsy_jackknife"'
---|'"knife_outdoor"'
---|'"knife_stiletto"'
---|'"knife_widowmaker"'
---|'"knife_skeleton"'
---|'"knife_kukri"'

---@alias csweapon_category
---|'"other"'
---|'"melee"'
---|'"secondary"'
---|'"smg"'
---|'"rifle"'
---|'"heavy"'

---@alias observer_mode_t
---|'"none"'
---|'"fixed"'
---|'"in_eye"'
---|'"chase"'
---|'"roaming"'
---|'"directed"'

---@alias client_frame_stage
---|'"undefined"'
---|'"start"'
---|'"render_start"'
---|'"net_update_start"'
---|'"net_update_preprocess"'
---|'"net_pre_entity_packet"'
---|'"net_update_postdataupdate_start"'
---|'"net_update_postdataupdate_end"'
---|'"net_update_end"'
---|'"net_creation"'
---|'"render_end"'

---@alias input_bit_mask
---|'"in_attack"'
---|'"in_attack2"'
---|'"in_jump"'
---|'"in_duck"'
---|'"in_forward"'
---|'"in_back"'
---|'"in_use"'
---|'"in_turnleft"'
---|'"in_turnright"'
---|'"in_moveleft"'
---|'"in_reload"'
---|'"in_speed"'
---|'"in_joyautosprint"'
---|'"in_useorreload"'
---|'"in_score"'
---|'"in_zoom"'
---|'"in_look_at_weapon"'

-- GUI System
---@class gui
---@field ctx gui.context
---@field notify gui.notification_system
---@field input gui.context_input
gui = {}

---@param text string Label text
---@param c gui.control Control object
---@return gui.layout
function gui.make_control(text, c) end

-- GUI Types
---@class gui.bits
local gui_bits = {}

function gui_bits:reset() end

---@return integer
function gui_bits:get_raw() end

---@param val integer
function gui_bits:set_raw(val) end

---@return boolean
function gui_bits:none() end

---@param bit integer
function gui_bits:set(bit) end

---@param bit integer
function gui_bits:unset(bit) end

---@param bit integer
---@return boolean
function gui_bits:get(bit) end

---@param bit integer
function gui_bits:toggle(bit) end

---@class gui.control_id
---@field id integer
---@field id_string string
local gui_control_id = {}

---@param id string
---@return gui.control_id
function gui.control_id(id) end

-- GUI Context
---@class gui.context
---@field user gui.user_t
local gui_context = {}

---@param id string Control ID
---@return gui.control?
function gui_context:find(id) end

---@class gui.user_t
---@field avatar draw.texture?
---@field username string
local gui_user_t = {}

-- GUI Input
---@class gui.context_input
local gui_context_input = {}

---@return draw.vec2
function gui_context_input:cursor() end

---@return draw.vec2
function gui_context_input:cursor_prev() end

---@return draw.vec2
function gui_context_input:cursor_delta() end

---@return boolean
function gui_context_input:did_cursor_move() end

---@return boolean
function gui_context_input:did_wheel_move() end

---@return boolean
function gui_context_input:did_process_mouse() end

---@return boolean
function gui_context_input:button_released() end

---@return number
function gui_context_input:wheel_delta() end

---@param mb gui.mouse_button
---@return boolean
function gui_context_input:is_mouse_up(mb) end

---@param mb gui.mouse_button
---@return boolean
function gui_context_input:is_mouse_down(mb) end

---@param mb gui.mouse_button
---@return boolean
function gui_context_input:is_mouse_clicked(mb) end

---@param mb gui.mouse_button
---@return boolean
function gui_context_input:is_mouse_released(mb) end

---@return boolean
function gui_context_input:did_process_key() end

---@param k integer
---@return boolean
function gui_context_input:is_key_up(k) end

---@param k integer
---@return boolean
function gui_context_input:is_key_down(k) end

---@param k integer
---@return boolean
function gui_context_input:is_key_clicked(k) end

---@param k integer
---@return boolean
function gui_context_input:is_key_released(k) end

---@alias gui.mouse_button
---|'"left"'
---|'"right"'
---|'"middle"'
---|'"back"'
---|'"forward"'

-- GUI Notification
---@class gui.notification_system
local gui_notification_system = {}

---@param notif gui.notification
function gui_notification_system:add(notif) end

---@class gui.notification
local gui_notification = {}

---@param hdr string Header
---@param txt string Text
---@param ico? draw.texture Icon
---@return gui.notification
function gui.notification(hdr, txt, ico) end

-- GUI Controls
---@class gui.control
---@field id integer
---@field id_string string
---@field is_visible boolean
---@field parent gui.control?
---@field type gui.control_type
---@field inactive boolean
---@field inactive_text string
---@field inactive_color draw.color
---@field tooltip string
---@field aliases string[]
local gui_control = {}

---@return boolean
function gui_control:get_hotkey_state() end

---@param val boolean
function gui_control:set_visible(val) end

---@param cbk function
function gui_control:add_callback(cbk) end

---@return gui.control
function gui_control:cast() end

function gui_control:reset() end

---@alias gui.control_type
---|'"default"'
---|'"button"'
---|'"checkbox"'
---|'"child_tab"'
---|'"color_picker"'
---|'"combo_box"'
---|'"control_container"'
---|'"group"'
---|'"hotkey"'
---|'"hsv_slider"'
---|'"label"'
---|'"layout"'
---|'"list"'
---|'"loading"'
---|'"notification_control"'
---|'"popup"'
---|'"selectable"'
---|'"slider"'
---|'"spacer"'
---|'"tab"'
---|'"tabs_layout"'
---|'"weapon_tabs_layout"'
---|'"text_input"'
---|'"toggle_button"'
---|'"window"'
---|'"widget"'
---|'"settings"'
---|'"image"'

---@class gui.value_param_bool
local gui_value_param_bool = {}

---@return boolean
function gui_value_param_bool:get() end

---@return boolean
function gui_value_param_bool:get_direct() end

---@param val boolean
function gui_value_param_bool:set(val) end

---@return boolean
function gui_value_param_bool:get_hotkey_state() end

function gui_value_param_bool:disable_hotkeys() end

---@class gui.value_param_float
local gui_value_param_float = {}

---@return number
function gui_value_param_float:get() end

---@return number
function gui_value_param_float:get_direct() end

---@param val number
function gui_value_param_float:set(val) end

---@return boolean
function gui_value_param_float:get_hotkey_state() end

function gui_value_param_float:disable_hotkeys() end

---@class gui.value_param_color
local gui_value_param_color = {}

---@return draw.color
function gui_value_param_color:get() end

---@return draw.color
function gui_value_param_color:get_direct() end

---@param val draw.color
function gui_value_param_color:set(val) end

---@return boolean
function gui_value_param_color:get_hotkey_state() end

function gui_value_param_color:disable_hotkeys() end

---@class gui.value_param_bits
local gui_value_param_bits = {}

---@return gui.bits
function gui_value_param_bits:get() end

---@return gui.bits
function gui_value_param_bits:get_direct() end

---@param val gui.bits
function gui_value_param_bits:set(val) end

---@return boolean
function gui_value_param_bits:get_hotkey_state() end

function gui_value_param_bits:disable_hotkeys() end

-- Specific GUI Controls
---@class gui.checkbox: gui.control
local gui_checkbox = {}

---@param id gui.control_id
---@return gui.checkbox
function gui.checkbox(id) end

---@return gui.value_param_bool
function gui_checkbox:get_value() end

---@param val boolean
function gui_checkbox:set_value(val) end

---@class gui.slider: gui.control
local gui_slider = {}

---@param id gui.control_id
---@param low number
---@param high number
---@param fmt? table
---@param step? number
---@return gui.slider
function gui.slider(id, low, high, fmt, step) end

---@return gui.value_param_float
function gui_slider:get_value() end

---@class gui.label: gui.control
local gui_label = {}

---@param id gui.control_id
---@param str string
---@param col? draw.color
---@param bold? boolean
---@return gui.label
function gui.label(id, str, col, bold) end

---@param str string
function gui_label:set_text(str) end

---@class gui.selectable: gui.control
local gui_selectable = {}

---@param id gui.control_id
---@param str string
---@return gui.selectable
function gui.selectable(id, str) end

---@class gui.button: gui.control
local gui_button = {}

---@param id gui.control_id
---@param str string
---@return gui.button
function gui.button(id, str) end

---@class gui.color_picker: gui.control
local gui_color_picker = {}

---@param id gui.control_id
---@param allow_alpha? boolean
---@return gui.color_picker
function gui.color_picker(id, allow_alpha) end

---@return gui.value_param_color
function gui_color_picker:get_value() end

---@class gui.spacer: gui.control
local gui_spacer = {}

---@param id gui.control_id
---@return gui.spacer
function gui.spacer(id) end

---@class gui.text_input: gui.control
---@field placeholder string
---@field value string
local gui_text_input = {}

---@param id gui.control_id
---@return gui.text_input
function gui.text_input(id) end

---@param str string
function gui_text_input:set_value(str) end

---@class gui.combo_box: gui.control_container
---@field allow_multiple boolean
local gui_combo_box = {}

---@param id gui.control_id
---@return gui.combo_box
function gui.combo_box(id) end

---@return gui.value_param_bits
function gui_combo_box:get_value() end

---@class gui.image: gui.control
local gui_image = {}

---@param id gui.control_id
---@param tex draw.texture
---@return gui.image
function gui.image(id, tex) end

-- GUI Containers
---@class gui.container
local gui_container = {}

---@param ctrl gui.control
function gui_container:add(ctrl) end

---@param ctrl gui.control
function gui_container:remove(ctrl) end

---@param id string
---@return gui.control?
function gui_container:find(id) end

---@class gui.control_container: gui.control, gui.container
local gui_control_container = {}

---@class gui.layout: gui.control_container
local gui_layout = {}

---@class gui.group: gui.control_container
local gui_group = {}

-- Utils
---@class utils
utils = {}

---@param str string
---@return string
function utils.base64_encode(str) end

---@param str string
---@return string
function utils.base64_decode(str) end

---@return integer
function utils.get_unix_time() end

---@param str string
---@return integer
function utils.murmur2(str) end

---@param str string
---@return integer
function utils.fnv1a(str) end

---@param mod string
---@param exp string
---@return integer
function utils.find_export(mod, exp) end

---@param mod string
---@param pattern string
---@return integer
function utils.find_pattern(mod, pattern) end

---@return string
function utils.clipboard_get() end

---@param str string
function utils.clipboard_set(str) end

-- Common Types
---@class ptr
local ptr = {}

---@param num integer
---@return ptr
function ptr(num) end

---@class ref_holder_t
---@field val any
local ref_holder_t = {}

---@class vector
---@field x number
---@field y number
---@field z number
local vector = {}

---@overload fun(): vector
---@overload fun(value: number): vector
---@overload fun(x: number, y: number, z: number): vector
---@param x? number
---@param y? number
---@param z? number
---@return vector
function vector(x, y, z) end

---@param tolerance? number
---@return boolean
function vector:is_zero(tolerance) end

---@param other vector
---@return number
function vector:dist(other) end

---@param other vector
---@return number
function vector:dist_sqr(other) end

---@param other vector
---@return number
function vector:dist_2d(other) end

---@param other vector
---@return number
function vector:dist_2d_sqr(other) end

---@param other vector
---@return vector
function vector:cross(other) end

---@return boolean
function vector:is_valid() end

---@return number
function vector:length() end

---@return number
function vector:length_sqr() end

---@return number
function vector:length_2d() end

---@return number
function vector:length_2d_sqr() end

---@param other vector
---@return number
function vector:dot(other) end

---@class vector4d
---@field x number
---@field y number
---@field z number
---@field w number
local vector4d = {}

---@class veccolor
---@field r number
---@field g number
---@field b number
local veccolor = {}

---@class color
local color = {}

---@class cview_setup
---@field fov number
---@field fov_viewmodel number
---@field origin vector
---@field view vector
---@field aspect_ratio number
local cview_setup = {}

---@class cuser_cmd
---@field command_number integer
local cuser_cmd = {}

---@param button input_bit_mask
---@return boolean
function cuser_cmd:get_button(button) end

---@param button input_bit_mask
function cuser_cmd:set_button(button) end

---@param button input_bit_mask
function cuser_cmd:remove_button(button) end

---@return vector
function cuser_cmd:get_viewangles() end

---@param angles vector
function cuser_cmd:set_viewangles(angles) end

function cuser_cmd:lock_angles() end

---@return number
function cuser_cmd:get_forwardmove() end

---@return number
function cuser_cmd:get_leftmove() end

---@param forwardmove number
function cuser_cmd:set_forwardmove(forwardmove) end

---@param leftmove number
function cuser_cmd:set_leftmove(leftmove) end

---@param yaw number
function cuser_cmd:rotate_movement(yaw) end

---@class game_event_t
local game_event_t = {}

---@return string
function game_event_t:get_name() end

---@param key string
---@return boolean
function game_event_t:get_bool(key) end

---@param key string
---@return integer
function game_event_t:get_int(key) end

---@param key string
---@return number
function game_event_t:get_float(key) end

---@param key string
---@return string?
function game_event_t:get_string(key) end

---@param key string
---@return cs2_player_controller
function game_event_t:get_controller(key) end

---@param key string
---@return cs2_player_pawn
function game_event_t:get_pawn_from_id(key) end
