Shader "Custom/UV_PlusNum"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
       _FlowSpeed ("Flow Speed", float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard 

        sampler2D _MainTex;
        float _FlowSpeed;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // fixed4 c = tex2D (_MainTex, IN.uv_MainTex + 0.5);       // x, y 방향으로 +0.5씩
            fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x, IN.uv_MainTex.y + _Time.y * _FlowSpeed)); 
            o.Emission = c.rgb;
    
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

// === 시간에 관련된 변수 사용 방법 === //
// _Time                float4          씬이 열린 다음부터의 시간 (x, y, z, w)는 (t/20, t, t*2, t*3)에 대응     _Time.x는 1/20속도, _Time.y는 원래의 시간, _Time.z는 2배 속도의 시간, _Time.w는 3배 속도의 시간
// _SinTime             float4          Sin 그래프의 시간. xyzw는 (t/8, t/4, t/2, t)와 대응
// _CosTime             float4          Cos 그래프의 시간. xyzw는 (t/8, t/4, t/2, t)와 대응
// _unity_DeltaTime     float4          Delta time. xyzw는 (dt, 1/dt, smoothDt, 1/smoothDt)