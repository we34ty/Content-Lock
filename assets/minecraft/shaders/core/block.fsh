#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif
    float r=(color.r+((color.b+color.g)*(1.0-(2*min(0.5,vertexColor.r)))))/max(1.0,3*(1.0-2*min(0.5,vertexColor.r)));
    float g=(color.g+((color.b+color.r)*(1.0-(2*min(0.5,vertexColor.g)))))/max(1.0,3*(1.0-2*min(0.5,vertexColor.g)));
    float b=(color.b+((color.r+color.g)*(1.0-(2*min(0.5,vertexColor.b)))))/max(1.0,3*(1.0-2*min(0.5,vertexColor.b)));
    color.r=r;
    color.g=g;
    color.b=b;
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
