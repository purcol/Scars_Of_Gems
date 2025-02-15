shader_type canvas_item;

group_uniforms Sine;
uniform bool do_quantize;
uniform float quantize_to : hint_range(0, 2, 0.1) = 1;
uniform vec2 sine_amplitude_ = vec2(1.0, 1.0);
uniform vec2 sine_speed = vec2(1.0, 0.0);

void vertex() {
	vec2 m = sine_amplitude_;
	vec2 s = vec2(0,sin(TIME * sine_speed).x);
	VERTEX += (s*m);
	if (do_quantize) {
		VERTEX = round(VERTEX / quantize_to);
		VERTEX *= quantize_to;
	}
}