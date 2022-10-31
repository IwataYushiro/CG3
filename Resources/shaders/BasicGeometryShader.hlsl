#include "BasicShaderHeader.hlsli"

//�O�p�`���O�p�`��2�o�͂���T���v��
//(�r����UV���H���ă^�C�����O)
[maxvertexcount(6)]//�ő�o�͒��_��
void main(
	triangle VSOutput input[3] : SV_POSITION, //���Ƃ��F�X����
	//�O�p�`�X�g���[��
	inout TriangleStream< GSOutput > output//�����ŏo��
)
{
	//�O�p�`1��
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//�o�͗p���_�f�[�^
		//�����̎n�_
		element.svpos = input[i].svpos;		//���_���W���R�s�[
		element.normal = input[i].normal;	//�@�����R�s�[
		element.uv = input[i].uv;			//UV���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
	}
	//���݂̃X�g���b�v���I��
	output.RestartStrip();

	//�O�p�`2��
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//�o�͗p���_�f�[�^
		//�����̎n�_
		element.svpos = input[i].svpos
			+ float4(20.0f, 0.0f, 0.0f, 0.0f);//���_���W��X������20���炷
		element.normal = input[i].normal;	//�@�����R�s�[
		element.uv = input[i].uv * 5.0f;			//UV��5�{��
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
	}
}