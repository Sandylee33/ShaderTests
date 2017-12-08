// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Debug/Normals" {
SubShader {
    Pass {
        CGPROGRAM
        #pragma vertex vert
        #pragma fragment frag
        #include "UnityCG.cginc"

        // vertex input: position, normal
        struct appdata {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
        };

        struct v2f {
            float4 pos : SV_POSITION;
           // fixed4 color : COLOR;
            fixed3 wpos: POSITION1;
        };
        
        v2f vert (appdata v) {
            v2f o;
            o.pos = UnityObjectToClipPos(v.vertex);
            o.wpos = mul(unity_ObjectToWorld,v.vertex).xyz;
            return o;
        }
        
        half4 frag (v2f i) : COLOR { 
        return half4(abs(i.wpos - floor(i.wpos)-0.5)*2,1.0f); 
        }
        ENDCG
    }
}
}