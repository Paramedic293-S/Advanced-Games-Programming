Texture2D texture0;
SamplerState sampler0;

cbuffer CBuffer0
{
	matrix WVPMatrix;
	/*matrix WVPMatrix2;*/
	float4 directional_light_vector;
	float4 directional_light_colour;
	float4 ambient_light_colour;
	/*float red_fraction;
	float Scale;
	float2 packing;*/
};

struct VOut
{
	float4 position: SV_POSITION;
	float4 color : COLOR;
	float2 texcoord : TEXCOORD;
	float3 normal : NORMAL;
};

VOut VShader(float4 position : POSITION, float4 color : COLOR, float2 texcoord : TEXCOORD, float3 normal: NORMAL)
{
	VOut output;

	/*color.r *= red_fraction;*/
	/*output.position = position;
	output.position.x *= Scale;
	output.position.y *= (1.0 - Scale);
	output.position.xy *= Scale;*/
	output.position = mul(WVPMatrix, position);
	float diffuse_amount = dot(directional_light_vector, normal);
	diffuse_amount = saturate(diffuse_amount);
	output.color = ambient_light_colour + (directional_light_colour * diffuse_amount);
	/*output.position = mul(WVPMatrix2, position);*/
	output.texcoord = texcoord;

	return output;
}

float4 PShader (float4 position : SV_POSITION, float4 color : COLOR, float2 texcoord : TEXCOORD, float3 normal: NORMAL) : SV_TARGET
{
	return color * texture0.Sample(sampler0, texcoord);
}