#include "BasicShaderHeader.hlsli"

//�O�p�`��������3�o�͂���T���v��
[maxvertexcount(4)]//�ő�o�͒��_��
void main(
	triangle VSOutput input[3] : SV_POSITION, //���Ƃ��F�X����

	//�_�X�g���[��
	inout LineStream< GSOutput > output//�����ŏo��
)
{

	GSOutput element;					//�o�͗p���_�f�[�^

	//�O�p�`�̒��_��1�_������
	for (uint i = 0; i < 3; i++)
	{
		//�����̎n�_
		element.svpos = input[i].svpos;		//���_���W���R�s�[
		element.normal = input[i].normal;	//�@�����R�s�[
		element.uv = input[i].uv;			//UV���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
	}
	//�ŏ��̓_��������ǉ�
	element.svpos = input[0].svpos;		//���_���W���R�s�[
	element.normal = input[0].normal;	//�@�����R�s�[
	element.uv = input[0].uv;			//UV���R�s�[
	//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
	output.Append(element);

}