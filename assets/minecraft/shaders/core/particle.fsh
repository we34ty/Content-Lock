#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec2 texCoord0;
in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    float vertexAvg = (vertexColor.r + vertexColor.g + vertexColor.b) / 3.0;
    float r=(color.r+((color.b+color.g)*(1.0-(min(0.35,vertexAvg)/0.35))))/max(1.0,3*(1.0-(min(0.35,vertexAvg))/0.35));
    float g=(color.g+((color.b+color.r)*(1.0-(min(0.35,vertexAvg)/0.35))))/max(1.0,3*(1.0-(min(0.35,vertexAvg))/0.35));
    float b=(color.b+((color.r+color.g)*(1.0-(min(0.35,vertexAvg)/0.35))))/max(1.0,3*(1.0-(min(0.35,vertexAvg))/0.35));
    color.r=r;
    color.g=g;
    color.b=b;
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
