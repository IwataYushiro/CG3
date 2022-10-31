#include "BasicShaderHeader.hlsli"

//�_���O�p�`���o�͂���T���v��
[maxvertexcount(3)]//�ő�o�͒��_��
void main(
	point VSOutput input[1] : SV_POSITION, //���Ƃ��F�X����
	//�O�p�`�X�g���[��
	inout TriangleStream< GSOutput > output//�����ŏo��
)
{
	
		GSOutput element;					//�o�͗p���_�f�[�^
		//���_���
		//����
		element.normal = input[0].normal;	//�@�����R�s�[
		element.uv = input[0].uv;			//UV���R�s�[
		
		//1�_��
		element.svpos = input[0].svpos;		//���_���W���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);

		//2�_��
		element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0.0f, 0.0f);		//���_���W���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);

		//3�_��
		element.svpos = input[0].svpos + float4(10.0f, 0.0f, 0.0f, 0.0f);		//���_���W���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
}