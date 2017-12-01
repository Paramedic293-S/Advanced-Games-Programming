cbuffer CBuffer0
{
	matrix WVPMatrix;
	float red_fraction;
	float Scale;
	float2 packing;
};

struct VOut
{
	float4 position: SV_POSITION;
	float4 color : COLOR;
};

VOut VShader(float4 position : POSITION, float4 color : COLOR)
{
	VOut output;

	color.r *= red_fraction;
	/*output.position = position;
	output.position.x *= Scale;
	output.position.y *= (1.0 - Scale);
	output.position.xy *= Scale;*/
	output.position = mul(WVPMatrix, position);
	output.color = color;

	return output;
}

float4 PShader (float4 position : SV_POSITION, float4 color : COLOR) : SV_TARGET
{
	return color;
}