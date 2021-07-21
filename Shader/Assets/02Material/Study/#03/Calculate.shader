Shader "Custom/Calculate"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _TestColor ("testcolor", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        float4 _TestColor;


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // === #01 === //
            // float r = 1;
            // float2 gg = float2(0.5, 0);
            // float3 bbb = float3(1, 0, 1);
            // === #01 === //

            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            // === #01 === //
            // o.Albedo = float3(0,0,0);
            // o.Albedo = float3(r,0,0);                // 이와 같이 응용 가능!
            // o.Albedo = float3(0,gg);
            // o.Albedo = float3(bbb.b, gg.r, r.r);        // (1, 0.5, 1)
            // === #01 === //

            // === #02 === //
            o.Albedo = _TestColor.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;
            // === #02 === //            
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
