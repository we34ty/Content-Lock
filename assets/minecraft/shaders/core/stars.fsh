#version 150

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

out vec4 fragColor;

vec4 lerp_vec4(vec4 a, vec4 b, float t) {
    if (t < 0.0f) t = 0.0f;
    if (t > 1.0f) t = 1.0f;

    vec4 result;
    result.x = a.x + (b.x - a.x) * t;
    result.y = a.y + (b.y - a.y) * t;
    result.z = a.z + (b.z - a.z) * t;
    result.w = a.w + (b.w - a.w) * t;
    return result;
}

void main() {
    const vec4 col1 = vec4(0.7, 0.7, 1, 1);
    const vec4 col2 = vec4(0.7, 0.7, 1, 0.5); 
    fragColor = lerp_vec4(col1, col2, (sin(GameTime * 5000 + 0.00001 * sqrt(pow(gl_FragCoord.x, 2) * pow(gl_FragCoord.y, 2))) + 1) * 0.5);
}
