static float2 positions[3] =
{
    float2(0.0, -0.5),
    float2(0.5, 0.5),
    float2(-0.5, 0.5)
};

static float3 colors[3] =
{
    float3(1.0, 0.0, 0.0),
    float3(0.0, 1.0, 0.0),
    float3(0.0, 0.0, 1.0)
};

struct VSOutput
{
    float4 pos : SV_POSITION; // 内置：裁剪空间坐标
    float3 color : COLOR0; // 自定义：传给 PS → location 0
};

VSOutput main(uint vertexIndex : SV_VertexID)
{
    VSOutput o;
    o.pos = float4(positions[vertexIndex], 0.0, 1.0);
    o.color = colors[vertexIndex];
    return o;
}
