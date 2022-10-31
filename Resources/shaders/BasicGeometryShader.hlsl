#include "BasicShaderHeader.hlsli"

[maxvertexcount(3)]//�ő�o�͒��_��
void main(
	triangle VSOutput input[3] : SV_POSITION, //���Ƃ��F�X����
	inout TriangleStream< GSOutput > output//�����ŏo��
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv;
		output.Append(element);
	}
}