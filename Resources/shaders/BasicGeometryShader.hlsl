#include "BasicShaderHeader.hlsli"

//�_���_���o�͂���T���v��
[maxvertexcount(1)]//�ő�o�͒��_��
void main(
	point VSOutput input[1] : SV_POSITION, //���Ƃ��F�X����
	//�_�X�g���[��
	inout PointStream< GSOutput > output//�����ŏo��
)
{
	
		GSOutput element;					//�o�͗p���_�f�[�^
		//���_���
		element.svpos = input[0].svpos;		//���_���W���R�s�[
		element.normal = input[0].normal;	//�@�����R�s�[
		element.uv = input[0].uv;			//UV���R�s�[
		//���_��1�o�͂���(�o�̓��X�g�ɒǉ�)
		output.Append(element);
}