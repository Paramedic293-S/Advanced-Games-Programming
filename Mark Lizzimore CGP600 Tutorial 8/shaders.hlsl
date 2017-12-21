Texture2D texture0;
SamplerState sampler0;

cbuffer CBuffer0
{
	matrix WVPMatrix;
	matrix WVPMatrix2;
	float red_fraction;
	float Scale;
	float2 packing;
};

struct VOut
{
	float4 position: SV_POSITION;
	float4 color : COLOR;
	float2 texcoord : TEXCOORD;
};

VOut VShader(float4 position : POSITION, float4 color : COLOR, float2 texcoord : TEXCOORD)
{
	VOut output;

	color.r *= red_fraction;
	/*output.position = position;
	output.position.x *= Scale;
	output.position.y *= (1.0 - Scale);
	output.position.xy *= Scale;*/
	output.position = mul(WVPMatrix, position);
	/*output.position = mul(WVPMatrix2, position);*/
	output.color = color;
	output.texcoord = texcoord;

	return output;
}

float4 PShader (float4 position : SV_POSITION, float4 color : COLOR, float2 texcoord : TEXCOORD) : SV_TARGET
{
	return color * texture0.Sample(sampler0, texcoord);
}