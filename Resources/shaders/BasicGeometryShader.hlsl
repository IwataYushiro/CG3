#include "BasicShaderHeader.hlsli"

//三角形→点を3つ出力するサンプル
[maxvertexcount(3)]//最大出力頂点数
void main(
	triangle VSOutput input[3] : SV_POSITION, //線とか色々ある

	//点ストリーム
	inout PointStream< GSOutput > output//ここで出力
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//出力用頂点データ
		element.svpos = input[i].svpos;		//頂点座標をコピー
		element.normal = input[i].normal;	//法線をコピー
		element.uv = input[i].uv;			//UVをコピー

		//頂点をi個出力する(出力リストに追加)
		output.Append(element);
	}
}