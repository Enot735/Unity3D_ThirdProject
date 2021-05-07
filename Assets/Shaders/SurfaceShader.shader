Shader "Custom/SurfaceShader"
{
    /*Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _NormMap("BumpMap", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        Cull Off

        CGPROGRAM
        #pragma surface surf Lambert        

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;
            float3 worldPos;
        };

        sampler2D _MainTex;
        sampler2D _BumpMap;

        void surf(Input IN, inout SurfaceOutput o)
        {
            clip(frac((IN.worldPos.y + IN.worldPos.z * 0.1) * 5) - 0.5);
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
        }
        ENDCG
    }*/

    Properties
    {
        _Color("Color", Color) = (1, 1, 1, 1)
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 200
        Cull Off

        CGPROGRAM
        #pragma surface surf Lambert
        #pragma target 3.0

        struct Input
        {
            float3 worldPos;
        };

        float4 _Color;

        void surf(Input IN, inout SurfaceOutput o)
        {
            clip(frac((IN.worldPos.y + IN.worldPos.z * 0.1) * 5) - 0.5);
            o.Albedo = _Color.rgb;
            o.Alpha = _Color.a;
        }
        ENDCG
    }

    FallBack "Diffuse"
}
