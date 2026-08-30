#version 330
in vec2 texcoord;
uniform sampler2D tex;
vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec4 c = texelFetch(tex, ivec2(texcoord), 0);
    float gray = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    return vec4(gray, gray, gray, c.a);
}