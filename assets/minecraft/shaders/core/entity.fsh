#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
#ifdef PER_FACE_LIGHTING
in vec4 vertexPerFaceColorBack;
in vec4 vertexPerFaceColorFront;
#else
in vec4 vertexColor;
#endif
in vec4 lightMapColor;
in vec4 overlayColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif
#ifdef PER_FACE_LIGHTING
    color *= (gl_FrontFacing ? vertexPerFaceColorFront : vertexPerFaceColorBack) * ColorModulator;
#else
    color *= vertexColor * ColorModulator;
#endif
#ifndef NO_OVERLAY
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
#endif
#ifndef EMISSIVE
    color *= lightMapColor;

    float vertexAvg = (lightMapColor.r + lightMapColor.g + lightMapColor.b) / 3.0;
    float r=(color.r+((color.b+color.g)*(1.0-(min(0.35,vertexAvg)/0.35))))/max(1.0,3*(1.0-(min(0.35,vertexAvg))/0.35));
    float g=(color.g+((color.b+color.r)*(1.0-(min(0.35,vertexAvg)/0.35))))/max(1.0,3*(1.0-(min(0.35,vertexAvg))/0.35));
    float b=(color.b+((color.r+color.g)*(1.0-(min(0.35,vertexAvg)/0.35))))/max(1.0,3*(1.0-(min(0.35,vertexAvg))/0.35));
    color.r=r;
    color.g=g;
    color.b=b;
#endif
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
