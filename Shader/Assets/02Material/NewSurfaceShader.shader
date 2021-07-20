Shader "ShaderSutydy/Test/Chapter1/NewSurfaceShader"
{
    // === #01 Part (유니티 자체 스크립트) === //
    Properties
    {
        _Brightenss ("change Brightness!", Range(0, 1)) = 0
        _TestFloat ("Test Float!", Float) = 0.5
        _TestColor ("Test color!", Color) = (1,1,1,1)
        _TestVector ("Test Vector!", Vector) = (1,1,1,1)
        _TestTexture ("Test Texture!!", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    // === #01 Part (유니티 자체 스크립트) === //

    // === #02 Part (유니티 자체 스크립트) === //
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        // === #03 Part (CG라는 쉐이더 언어) === //
        CGPROGRAM
        // == 설정 부분 == //
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows /*noambient (Ambient를 사용하지 않겠다!)*/

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0
        // == 설정 부분 == //

        sampler2D _MainTex;

        // == 'Input'이라는 이름을 가진 구조체! 이 안에 넣는 내용은 '엔진으로부터 받아와야 할 데이터'들이 들어간다. == //
        struct Input
        {
            float2 uv_MainTex;
        };
        // == 'Input'이라는 이름을 가진 구조체! 이 안에 넣는 내용은 '엔진으로부터 받아와야 할 데이터'들이 들어간다. == //

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;


        // == '함수' 영역이다. 색상이나 이미지가 출력되는 부분을 만들 수 있다! == //
        /*
        struct SurfaceOutputStandard
        {
            fixed3 Albedo;
            fixed3 Normal;
            fixed3 Emission;
            half Metallic;
            half Smoothness;
            half Occlusion;
            half Alpha;
        }
        즉, SurfaceOutputStandard 안에는 7개의 변수가 들어 있고, 이 변수를 불러서 간단히 값을 넣는 것만으로 출력값을 만들 수 있다!
        */
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            // === Surface Output Standard
            //o.Albedo = float3(1,0,0);                 // 조명 연산을 추가로 받게 된다.
            o.Emission = float3(1,0,0);                 // 조명 연산을 받지 않아서 순수한 색상만 출력된다.

            o.Alpha = c.a;
        }
        // == '함수' 영역이다. 색상이나 이미지가 출력되는 부분을 만들 수 있다! == //

        ENDCG
        // === #03 Part (CG라는 쉐이더 언어) === //
    }
    // === #02 Part (유니티 자체 스크립트) === //

    FallBack "Diffuse"
}


// Q. float, half, fixed 란
// float(32bit)의 1/2 크기가 half(16bit)이며, half보다 더 작은 크기가 fixed(11bit) 이다.
// 컬러나 벡터 길이는 fixed로 충분하고, 범위나 정밀도가 필요한 것은 half, 나머지는 float을 사용하는 것이 좋다!
// 하지만 잘 모를때는 그냥 float 써도 괜찮다. (성능을 올리고 싶다면 알맞게 사용하면 됨!)