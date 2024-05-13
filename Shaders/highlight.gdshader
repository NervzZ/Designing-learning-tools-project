shader_type canvas_item;

void fragment() {
    vec2 uv = UV;
    vec4 tex_color = texture(TEXTURE, uv);
    float alpha = tex_color.a;
    vec3 color = tex_color.rgb;
	
    // Outline color
    vec4 outlineColor = vec4(1.0, 0.8, 0.0, 1.0); // Yellow
	
	float outlineSize = 0.02;

    float maxAlpha = 0.0;
    for(int x = -1; x <= 1; x++) {
        for(int y = -1; y <= 1; y++) {
            vec2 step = vec2(float(x), float(y)) * outlineSize;
            maxAlpha = max(maxAlpha, texture(TEXTURE, uv + step).a);
        }
    }
	
	if(maxAlpha > alpha) {
	    COLOR = vec4(outlineColor.rgb, maxAlpha);
	} else {
		if(uv.x < outlineSize || uv.x > 1.0 - outlineSize || uv.y < outlineSize || uv.y > 1.0 - outlineSize) {
	        COLOR = vec4(outlineColor.rgb, maxAlpha);
	    } else {
	       	COLOR = vec4(color, alpha);
		}
	}
}