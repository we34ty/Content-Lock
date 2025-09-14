#version 150

// @javierbendezuv en curseforge, planetminecraft y modrinth

layout(std140) uniform Fog {
    vec4  FogColor;
    float FogEnvironmentalStart;
    float FogEnvironmentalEnd;
    float FogRenderDistanceStart;
    float FogRenderDistanceEnd;
    float FogSkyEnd;
    float FogCloudsEnd;
};

float linear_fog_value(float vertexDistance, float fogStart, float fogEnd) {
    fogStart/=3;
    if (vertexDistance <= fogStart) {
        return 0.0;
    } else if (vertexDistance >= fogEnd) {
        return 1.0;
    }
    return (vertexDistance - fogStart) / (fogEnd - fogStart);
}

float total_fog_value(
    float sphericalVertexDistance,
    float cylindricalVertexDistance,
    float environmentalStart,
    float environmentalEnd,
    float renderDistanceStart,
    float renderDistanceEnd
) {
    float start_multiplier = 1.1;
    float end_multiplier   = 1.2;
    float modifiedRenderStart = renderDistanceStart * start_multiplier;
    float modifiedRenderEnd   = renderDistanceEnd   * end_multiplier;
    float environmentalFog = linear_fog_value(sphericalVertexDistance, environmentalStart, environmentalEnd);
    float playerFog        = linear_fog_value(cylindricalVertexDistance, modifiedRenderStart, modifiedRenderEnd);
    return clamp(environmentalFog + playerFog, 0.0, 1.0);
}

vec4 apply_fog(
    vec4 inColor,
    float sphericalVertexDistance,
    float cylindricalVertexDistance,
    float environmentalStart,
    float environmentalEnd,
    float renderDistanceStart,
    float renderDistanceEnd,
    vec4 fogColor
) {
    float fogValue = total_fog_value(
        sphericalVertexDistance,
        cylindricalVertexDistance,
        environmentalStart,
        environmentalEnd,
        renderDistanceStart,
        renderDistanceEnd
    );
    fogValue = clamp(fogValue * 1.5, 0.0, 1.0);
    float curvedFog = pow(fogValue, 1.1) / (pow(fogValue, 1.1) + pow(1.0 - fogValue, 3));
    return vec4(mix(inColor.rgb, fogColor.rgb, curvedFog * fogColor.a), inColor.a);
}

float fog_spherical_distance(vec3 pos) {
    return length(pos);
}

float fog_cylindrical_distance(vec3 pos) {
    float distXZ = length(pos.xz);
    float distY  = abs(pos.y);
    return max(distXZ, distY);
}
