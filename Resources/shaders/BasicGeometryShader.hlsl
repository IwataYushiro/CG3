#include "BasicShaderHeader.hlsli"

//�O�p�`���O�p�`���o�͂���T���v��
//(�r����UV���H���ă^�C�����O)
[maxvertexcount(3)]//�ő�o�͒��_��
void main(
	triangle VSOutput input[3] : SV_POSITION, //���Ƃ��F�X����
	//�O�p�`�X�g���[��
	inout TriangleStream< GSOutput > output//�����ŏo��
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//�o�͗p���_�f�[�^
		//�����̎n�_
		element.svpos = input[i].svpos;		//���_���W���R�s�[
		element.normal = input[i].normal;	//�@�����R�s�[
		element.uv = input[i].uv*2.0f;			//UV��2�{��
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
	}
	
}