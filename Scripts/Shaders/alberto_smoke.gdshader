shader_type fog;

uniform float falloff = 0.0;

void fog() {
	float sdf = - SDF;
	DENSITY = step(0.0, sdf);
	ALBEDO = vec3(1.0);
}
