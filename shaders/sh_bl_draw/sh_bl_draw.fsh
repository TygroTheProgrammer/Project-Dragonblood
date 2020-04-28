varying vec2 v_vTexcoord;

uniform vec4 color;

void main() {
    gl_FragColor = mix(vec4(1.0), color, 1.0 - texture2D(gm_BaseTexture, v_vTexcoord).r);
}
