#include "BasicShaderHeader.hlsli"

//�O�p�`��������1�o�͂���T���v��
[maxvertexcount(2)]//�ő�o�͒��_��
void main(
	triangle VSOutput input[3] : SV_POSITION, //���Ƃ��F�X����

	//�_�X�g���[��
	inout LineStream< GSOutput > output//�����ŏo��
)
{
	//for (uint i = 0; i < 3; i++)
	//{
		GSOutput element;					//�o�͗p���_�f�[�^

		//�����̎n�_
		element.svpos = input[0].svpos;		//���_���W���R�s�[
		element.normal = input[0].normal;	//�@�����R�s�[
		element.uv = input[0].uv;			//UV���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);

		//�����̏I�_
		element.svpos = input[1].svpos;		//���_���W���R�s�[
		element.normal = input[1].normal;	//�@�����R�s�[
		element.uv = input[1].uv;			//UV���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
	//}
}