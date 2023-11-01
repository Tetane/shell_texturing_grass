shader_type spatial;
render_mode cull_disabled, unshaded;

uniform sampler2D noiseTex : filter_nearest_mipmap_anisotropic;
uniform int instance_count;
uniform vec4 col : source_color;
varying float tresh; // treshold to discard pixels

void vertex(){
	tresh = float(INSTANCE_ID) / float(instance_count);
}

void fragment() {
	float noiseVal = texture(noiseTex, UV).r;
	if (noiseVal < tresh){
		discard;
	}
	
	ALBEDO = col.rgb * tresh;
	
	// Fade borders
	ALPHA = clamp(1.0 - distance(vec2(0.5), UV)*2.0, 0.0, 1.0);
}
