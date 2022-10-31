#include "BasicShaderHeader.hlsli"

//�O�p�`���_��3�o�͂���T���v��
[maxvertexcount(3)]//�ő�o�͒��_��
void main(
	triangle VSOutput input[3] : SV_POSITION, //���Ƃ��F�X����

	//�_�X�g���[��
	inout PointStream< GSOutput > output//�����ŏo��
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//�o�͗p���_�f�[�^
		element.svpos = input[i].svpos;		//���_���W���R�s�[
		element.normal = input[i].normal;	//�@�����R�s�[
		element.uv = input[i].uv;			//UV���R�s�[

		//���_��i�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
	}
}