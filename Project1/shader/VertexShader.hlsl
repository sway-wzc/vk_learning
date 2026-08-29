static float2 positions[3] =
{
    float2(0.0, -0.5),
    float2(0.5, 0.5),
    float2(-0.5, 0.5)
};

float4 main(uint vertexIndex : SV_VertexID) : SV_POSITION
{
    return float4(positions[vertexIndex], 0.0, 1.0);
}
