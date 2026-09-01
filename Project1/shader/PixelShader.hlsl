struct PSInput
{
    float4 pos : SV_POSITION;
    float3 color : COLOR0; // 语义名必须和 VS 输出一致
};

float4 main(PSInput input) : SV_TARGET
{
    return float4(input.color, 1.0);
}
