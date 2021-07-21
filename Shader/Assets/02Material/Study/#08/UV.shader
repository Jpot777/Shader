Shader "Custom/UV"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard 


        sampler2D _MainTex;


        // 외부 인터페이스에서 받는 값이 아닌, 유니티 내부로부터 받는 데이터는 밑의 Input 구조체 안에 선언해야 한다!
        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex + 0.5);
            //o.Emission = IN.uv_MainTex.x;           // 0~1로 변하는 U의 모습
            //o.Emission = IN.uv_MainTex.y;           // 0~1로 변하는 Y의 모습
            o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0);       // (R, G, B)
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

// 언리얼, DirectX는 좌측 상단이 float2(0, 0)
// 유니티, OpenGL은 좌측 하단이 float2(0, 0)

// UV는 XY와 같고, 두 자리 숫자이기 때문에 float2 단위입니다.
// 그리고 버텍스에 이미 들어가 있는 데이터이므로, 유니티로부터 받아야 합니다.
// IN.uv_MainTex가 float2 단위의 UV이다.