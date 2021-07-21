Shader "Custom/Fire2"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard alpha:fade


        sampler2D _MainTex;
        sampler2D _MainTex2;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);
            //fixed4 d = tex2D (_MainTex2, float2(IN.uv_MainTex2.x - _Time.x, IN.uv_MainTex2.y));
            fixed4 d = tex2D (_MainTex2, float2(IN.uv_MainTex2.x, IN.uv_MainTex2.y - _Time.y));
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex + d.r);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

// 치명적인 것!
// 위 기능은 불효과처럼 나타날지는 몰라도 실무에서 쓰기에는 무리가 있다.
// #pragma surface surf Standard alpha:fade             <= 얘 때문
// Standard는 Standard 쉐이더 즉, '물리 기반 라이팅'이 작동되고 있다는 뜻이다. 
// 상당히 무거운 공식이며, 실제로 이 쉐이더에서는 이 물리 기반 라이팅 공식이 전혀 사용되지 않음에도 이 공식이 구동되고 있다! (매우 비효율적..)
// 이렇게 무거운 고급 라이팅 공식이 구동되고 있다는 것은 시스템 자원의 엄청난 낭비이다!
// 라이팅 연산이 없는 (전혀 처리하지 않는) 코드로 고치면 실제로 사용할 수 있다.