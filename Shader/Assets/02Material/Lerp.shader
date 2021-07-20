Shader "Custom/Lerp"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
        _Lerp ("Lerp", Range(0, 1)) = 0

    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard 

        

        sampler2D _MainTex;
        sampler2D _MainTex2;


        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };

        float _Lerp;


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);
            o.Albedo = lerp(d.rgb, c.rgb, c.a);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

// lerp 함수는 lerp(X, Y, s) 형태이다.
// X, Y는 반드시 같은 단위 (float / float2 / float3 / float4)인 2개의 인자가 사용되어야 한다.
// 마지막 s 인자는 반드시 한 자리의 수인 float이 사용되는데, 이 수치가 0이면 X가 출력되고, 1이면 Y가 출력되며, 0.5이면 X, Y가 반반 섞여서 출력된다!
