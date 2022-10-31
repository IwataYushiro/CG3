#include "BasicShaderHeader.hlsli"

//三角形→線分を3つ出力するサンプル
[maxvertexcount(4)]//最大出力頂点数
void main(
	triangle VSOutput input[3] : SV_POSITION, //線とか色々ある

	//点ストリーム
	inout LineStream< GSOutput > output//ここで出力
)
{

	GSOutput element;					//出力用頂点データ

	//三角形の頂点を1点ずつ扱う
	for (uint i = 0; i < 3; i++)
	{
		//線分の始点
		element.svpos = input[i].svpos;		//頂点座標をコピー
		element.normal = input[i].normal;	//法線をコピー
		element.uv = input[i].uv;			//UVをコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);
	}
	//最初の点をもう一つ追加
	element.svpos = input[0].svpos;		//頂点座標をコピー
	element.normal = input[0].normal;	//法線をコピー
	element.uv = input[0].uv;			//UVをコピー
	//頂点を1個出力する(出力リストに追加)
	output.Append(element);

}