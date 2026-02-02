float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
float4 vec4(float x0, float x1, float x2, float x3)
{
    return float4(x0, x1, x2, x3);
}
// Varyings
static float2 _v_vTexcoord = {0, 0};

static float4 gl_Color[4] =
{
    float4(0, 0, 0, 0),
    float4(0, 0, 0, 0),
    float4(0, 0, 0, 0),
    float4(0, 0, 0, 0)
};

cbuffer DriverConstants : register(b1)
{
};

uniform float _gm_AlphaRefValue : register(c0);
uniform bool _gm_AlphaTestEnabled : register(c1);
uniform SamplerState sampler__gm_BaseTexture : register(s0);
uniform Texture2D texture__gm_BaseTexture : register(t0);
uniform float4 _gm_FogColour : register(c2);
uniform bool _gm_PS_FogEnabled : register(c3);
uniform float2 _u_vShadowDelta : register(c4);
uniform float2 _u_vTexel : register(c5);

float4 gl_texture2D(Texture2D t, SamplerState s, float2 uv)
{
    return t.Sample(s, uv);
}

float4 gl_texture2DLod0(Texture2D t, SamplerState s, float2 uv)
{
    return t.SampleLevel(s, uv, 0);
}

#define GL_USES_MRT
#define GL_USES_FRAG_COLOR
;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
void _DoAlphaTestLod0(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
void _DoFogLod0(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
;
;
float _InsideTexture(in float2 _point)
{
{
float2 _result = (step(0.0, _point) - step(1.0, _point));
return (_result.x * _result.y);
;
}
}
float _InsideTextureLod0(in float2 _point)
{
{
float2 _result = (step(0.0, _point) - step(1.0, _point));
return (_result.x * _result.y);
;
}
}
;
float _SampleAlpha(in float2 _inTexcoord)
{
{
float2 _texcoord = {0, 0};
float _alpha = 0.0;
{for(int _iAngle = 0; (_iAngle < 8); (_iAngle++))
{
{
float _angle = ((6.2831855 * float(_iAngle)) / 8.0);
{for(int _radius = 1; (_radius <= 2); (_radius++))
{
{
(_texcoord = (_inTexcoord + (_u_vTexel * (float(_radius) * vec2(cos(_angle), sin(_angle))))));
(_alpha = lerp(_alpha, 1.0, (gl_texture2D(texture__gm_BaseTexture, sampler__gm_BaseTexture, _texcoord).w * _InsideTexture(_texcoord))));
}
;}
}
;
}
;}
}
;
return _alpha;
;
}
}
float _SampleAlphaLod0(in float2 _inTexcoord)
{
{
float2 _texcoord = {0, 0};
float _alpha = 0.0;
{for(int _iAngle = 0; (_iAngle < 8); (_iAngle++))
{
{
float _angle = ((6.2831855 * float(_iAngle)) / 8.0);
{for(int _radius = 1; (_radius <= 2); (_radius++))
{
{
(_texcoord = (_inTexcoord + (_u_vTexel * (float(_radius) * vec2(cos(_angle), sin(_angle))))));
(_alpha = lerp(_alpha, 1.0, (gl_texture2DLod0(texture__gm_BaseTexture, sampler__gm_BaseTexture, _texcoord).w * _InsideTextureLod0(_texcoord))));
}
;}
}
;
}
;}
}
;
return _alpha;
;
}
}
;
void gl_main()
{
{
if(all((_u_vShadowDelta == float2(0.0, 0.0))))
{
{
(gl_Color[0] = vec4(gl_texture2D(texture__gm_BaseTexture, sampler__gm_BaseTexture, _v_vTexcoord).w, _SampleAlpha(_v_vTexcoord), 0.0, 1.0));
}
;
}
else
{
{
(gl_Color[0] = vec4(gl_texture2D(texture__gm_BaseTexture, sampler__gm_BaseTexture, _v_vTexcoord).w, _SampleAlpha(_v_vTexcoord), _SampleAlpha((_v_vTexcoord - (_u_vTexel * _u_vShadowDelta))), 1.0));
}
;
}
;
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : SV_Target0;
    float4 gl_Color1 : SV_Target1;
    float4 gl_Color2 : SV_Target2;
    float4 gl_Color3 : SV_Target3;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_vTexcoord = input.v0.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];
    output.gl_Color1 = gl_Color[0];
    output.gl_Color2 = gl_Color[0];
    output.gl_Color3 = gl_Color[0];

    return output;
}
