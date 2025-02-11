shader_type canvas_item;
render_mode unshaded;

uniform float size = 0.3;
uniform vec2 posision = vec2(0.5);

void fragment() {
	vec4 start_color = COLOR;
	float seconds = 1.0-sin(TIME);
	float seconds_offset = 1.0-sin(TIME * 0.5);
	float circle = step(0.8-(size/seconds),distance(UV,posision));
	COLOR = vec4(start_color.x,start_color.y,start_color.z,1.0-(start_color.w*seconds)) - circle/vec4(1);
	COLOR = vec4(COLOR.x,COLOR.y,COLOR.z,COLOR.w-seconds_offset);
}
