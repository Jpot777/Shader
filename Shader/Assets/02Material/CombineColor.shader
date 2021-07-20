Shader "Custom/CombineColor"
{
    Properties
    {
        // _Color ("Color", Color) = (1,1,1,1)
        // _MainTex ("Albedo (RGB)", 2D) = "white" {}
        // _Glossiness ("Smoothness", Range(0,1)) = 0.5
        // _Metallic ("Metallic", Range(0,1)) = 0.0
        _Red ("Red", Range(0, 1)) = 0
        _Green ("Green", Range(0, 1)) = 0
        _Blue ("Blue", Range(0, 1)) = 0
        _BrightDark ("Brightness $ Darkness", Range(-1, 1)) = 0          // 0~1 로 하면 밝아지는 것만 조절 가능! 어둡게 하고 싶다면 범위를 -1~1로 설정!
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        // LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        // #pragma target 3.0

        // sampler2D _MainTex;

        struct Input
        {
            // float2 uv_MainTex;
            float4 color : COlOR;           // 에러를 피하기 위한 임시 코드!
        };

        // half _Glossiness;
        // half _Metallic;
        // fixed4 _Color;
        float _Red;
        float _Green;
        float _Blue;
        float _BrightDark;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // fixed4 c = tex2D (_MainTex, IN.uv_MainTex) /* * _Color*/;
            // === #01 === //
            //o.Albedo = float3(_Red, _Green, _Blue);
            // === #01 === //

            // === #02 === //
            o.Albedo = float3(_Red, _Green, _Blue) + _BrightDark;
            // === #02 === //

            // o.Alpha = c.a;               // surf함수 내에 c변수를 주석처리 하여서 코드 에러! 단순히 상수 1 값을 넣자요.
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
