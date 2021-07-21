// Compiled shader for PC, Mac & Linux Standalone

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/SwordOutline" {
Properties {
 _Color ("Main Color", Color) = (0.500000,0.500000,0.500000,1.000000)
 _MainTex ("Base (RGBA)", 2D) = "white" { }
 _Ramp ("Toon Ramp (RGB)", 2D) = "gray" { }
 _Color2 ("Aura Color", Color) = (0.000000,0.000000,1.000000,1.000000)
 _ColorR ("Rim Color", Color) = (0.000000,1.000000,1.000000,1.000000)
 _Outline ("Outline width", Range(0.002000,0.800000)) = 0.300000
 _OutlineZ ("Outline Z", Range(-0.060000,0.000000)) = -0.050000
 _NoiseTex ("Noise Texture", 2D) = "white" { }
 _Scale ("Noise Scale", Range(0.000000,0.200000)) = 0.010000
 _SpeedX ("Speed X", Range(-10.000000,10.000000)) = 0.000000
 _SpeedY ("Speed Y", Range(-10.000000,10.000000)) = 3.000000
 _Opacity ("Noise Opacity", Range(0.010000,10.000000)) = 10.000000
 _Brightness ("Brightness", Range(0.500000,3.000000)) = 2.000000
 _Edge ("Rim Edge", Range(0.000000,1.000000)) = 0.100000
 _RimPower ("Rim Power", Range(0.010000,10.000000)) = 1.000000
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 UsePass "Toon/Lit/FORWARD"
 Pass {
  Name "OUTLINE"
  Tags { "LIGHTMODE"="ALWAYS" "RenderType"="Opaque" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (344 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 glstate_matrix_projection at 144
  Matrix4x4 unity_MatrixInvV at 208
  Matrix4x4 unity_MatrixVP at 272
  Vector3 _WorldSpaceCameraPos at 0
  Float _Outline at 336
  Float _OutlineZ at 340
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4glstate_matrix_projection[4];
    float4 hlslcc_mtx4x4unity_MatrixInvV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float _Outline;
    float _OutlineZ;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float3 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float2 u_xlat4;
    float u_xlat8;
    float u_xlat12;
    u_xlat0.xyz = VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz * VGlobals.hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[2].xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[2].zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[3].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[2].www, u_xlat0.xyz);
    u_xlat0.z = dot(u_xlat0.xyz, input.NORMAL0.xyz);
    u_xlat1.xyz = VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz * VGlobals.hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[0].xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[0].zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[3].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[0].www, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, input.NORMAL0.xyz);
    u_xlat1.xyz = VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz * VGlobals.hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[1].xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[1].zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToObject[3].xyz, VGlobals.hlslcc_mtx4x4unity_MatrixInvV[1].www, u_xlat1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, input.NORMAL0.xyz);
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = rsqrt(u_xlat8);
    u_xlat0.xy = float2(u_xlat8) * u_xlat0.xy;
    u_xlat4.xy = u_xlat0.yy * VGlobals.hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4glstate_matrix_projection[0].xy, u_xlat0.xx, u_xlat4.xy);
    u_xlat0.xy = u_xlat0.xy * float2(VGlobals._Outline);
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.mtl_Position.xy = fma(u_xlat0.xy, u_xlat2.zz, u_xlat2.xy);
    output.mtl_Position.z = u_xlat2.z + VGlobals._OutlineZ;
    output.mtl_Position.w = u_xlat2.w;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    output.TEXCOORD1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    output.TEXCOORD2.xyz = float3(u_xlat12) * u_xlat0.xyz;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_NoiseTex" to slot 0

Constant Buffer "FGlobals" (76 bytes) on slot 0 {
  Vector4 _Time at 0
  Float _RimPower at 16
  Float _Scale at 20
  Float _Opacity at 24
  Float _Edge at 28
  Vector4 _Color2 at 32
  Vector4 _ColorR at 48
  Float _Brightness at 64
  Float _SpeedX at 68
  Float _SpeedY at 72
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _Time;
    float _RimPower;
    float _Scale;
    float _Opacity;
    float _Edge;
    float4 _Color2;
    float4 _ColorR;
    float _Brightness;
    float _SpeedX;
    float _SpeedY;
};

struct Mtl_FragmentIn
{
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_NoiseTex [[ sampler (0) ]],
    texture2d<float, access::sample > _NoiseTex [[ texture(0) ]] ,
    float4 mtl_FragCoord [[ position ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
    float2 u_xlat0;
    float4 u_xlat1;
    float2 u_xlat2;
    u_xlat0.x = dot(input.TEXCOORD1.xyz, input.TEXCOORD2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * FGlobals._RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2.xy = FGlobals._Time.xx * float2(FGlobals._SpeedX, FGlobals._SpeedY);
    u_xlat2.xy = fma(hlslcc_FragCoord.xy, float2(FGlobals._Scale), (-u_xlat2.xy));
    u_xlat2.x = _NoiseTex.sample(sampler_NoiseTex, u_xlat2.xy).w;
    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
    u_xlat0.y = u_xlat0.x + FGlobals._Edge;
    u_xlat0.xy = u_xlat0.xy * float2(FGlobals._Opacity);
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0f, 1.0f);
    u_xlat2.x = (-u_xlat0.x) + u_xlat0.y;
    u_xlat2.x = u_xlat2.x * FGlobals._Brightness;
    u_xlat1 = u_xlat2.xxxx * FGlobals._ColorR;
    output.SV_Target0 = fma(FGlobals._Color2, u_xlat0.xxxx, u_xlat1);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_NoiseTex" to slot 0

Constant Buffer "$Globals" (76 bytes) {
  Vector4 _Time at 0
  Float _RimPower at 16
  Float _Scale at 20
  Float _Opacity at 24
  Float _Edge at 28
  Vector4 _Color2 at 32
  Vector4 _ColorR at 48
  Float _Brightness at 64
  Float _SpeedX at 68
  Float _SpeedY at 72
}
Constant Buffer "$Globals" (104 bytes) {
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_ObjectToWorld at 16
  Vector4 unity_WorldToObject at 32
  Vector4 glstate_matrix_projection at 48
  Vector4 unity_MatrixInvV at 64
  Vector4 unity_MatrixVP at 80
  Float _Outline at 96
  Float _OutlineZ at 100
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Outline;
uniform 	float _OutlineZ;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat0.xyz;
    u_xlat0.z = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat4.xy = u_xlat0.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * u_xlat0.xx + u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_Outline);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position.xy = u_xlat0.xy * u_xlat2.zz + u_xlat2.xy;
    gl_Position.z = u_xlat2.z + _OutlineZ;
    gl_Position.w = u_xlat2.w;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _RimPower;
uniform 	float _Scale;
uniform 	float _Opacity;
uniform 	float _Edge;
uniform 	vec4 _Color2;
uniform 	vec4 _ColorR;
uniform 	float _Brightness;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
UNITY_LOCATION(0) uniform  sampler2D _NoiseTex;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2.xy = _Time.xx * vec2(_SpeedX, _SpeedY);
    u_xlat2.xy = hlslcc_FragCoord.xy * vec2(vec2(_Scale, _Scale)) + (-u_xlat2.xy);
    u_xlat1 = texture(_NoiseTex, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + (-u_xlat1.w);
    u_xlat0.y = u_xlat0.x + _Edge;
    u_xlat0.xy = u_xlat0.xy * vec2(_Opacity);
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat0.y;
    u_xlat2.x = u_xlat2.x * _Brightness;
    u_xlat1 = u_xlat2.xxxx * _ColorR;
    SV_Target0 = _Color2 * u_xlat0.xxxx + u_xlat1;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
Fallback "Toon/Basic"
}