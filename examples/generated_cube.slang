//
// NOTE: This file was auto-generated, do not modify by hand
//

#include <NoGraphicsAPIUtility/shader_types.h>
#include <NoGraphicsAPI/shader.slang>

struct CubeVertex {
    float4 position;
    float2 uv;
}

struct CubeRootArguments {
    CubeVertex* vertices;
    float4x4 transform;
}

