Shader "Custom/ShaderTest2D"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color",Color) = (1,1,1,1)
		_SecondTex("Second Texture",2D) = "white"{}
		_Tween ("Tween", Range(0,1)) = 0
	}
	SubShader
	{
	    Tags
	    {
	      "Queue" = "Transparent"
	    }
		

		Pass
		{
		    Blend SrcAlpha OneMinusSrcAlpha
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;
			float4 _Color;
			sampler2D _SecondTex;
			float _Tween;

			fixed4 frag (v2f i) : SV_Target
			{
			    //first texture
				float4 color1 = tex2D(_MainTex,i.uv);
				//second texture
				float4 color2 = tex2D(_SecondTex,i.uv);
				//e is for color changing based on the uv cord
				float4 e = float4(i.uv.x,i.uv.g,0,1);
				//c is for color tilting effect
				float4 c = _Color.xyzw;
				//d is for tween effect for sprite change
				float4 d = _Tween.xxxx;

				return (color1 *(1 - d)) + (color2 * d);
			}
			ENDCG
		}
	}
}
