Shader "Custom/ShaderOptimize"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}          // 텍스쳐 출력 부분
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
       
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows


        // Tip:)
        // 텍스쳐는 UV와 만나기 전까지는 그냥 메모리에 올라와 있는 텍스쳐일 뿐이고,
        // UV와 만나서 제대로 자리를 잡아야 비로소 float4로 표현할 수 있게 됩니다.
        // 따라서 현재 이 텍스쳐는 float4 _MainTex라고 선언하면 안되고, 아직은 "sampler"라고 불리는 "sampler2D"로 선언하는 것이다!
        sampler2D _MainTex;          // 텍스쳐 출력 부분
        

        struct Input
        {
            // UV는 vertex가 가지고 있습니다.
            // 우리가 만든 인터페이스가 아닌 vertex 내부에 있는 것을 엔진에게 내놓으라고 명령할 때!
            // Input 구조체 안헤 넣어야 한다. 이 구조체 안에는 임의로 만든 변수를 넣을 수 없으며, 반드시! 미리 정해진 규칙대로 작성해야만 한다.
            float2 uv_MainTex;       // 텍스쳐 출력 부분
        };

    
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // 텍스쳐를 연산하는 함수인 tex2D를 이용하여 텍스쳐의 컬러를 화면에 출력한다.
            // 텍스쳐 컬러는 채널당 8bit 이하이므로, fixed로도 충분하기 때문에 텍스쳐 변수는 fixed를 사용하도록 되어 있다.
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);      // 텍스쳐 출력 부분
            o.Albedo = c.rgb;

            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

