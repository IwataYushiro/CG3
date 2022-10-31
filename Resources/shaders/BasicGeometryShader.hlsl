#include "BasicShaderHeader.hlsli"

//三角形→線分を1つ出力するサンプル
[maxvertexcount(2)]//最大出力頂点数
void main(
	triangle VSOutput input[3] : SV_POSITION, //線とか色々ある

	//点ストリーム
	inout LineStream< GSOutput > output//ここで出力
)
{
	//for (uint i = 0; i < 3; i++)
	//{
		GSOutput element;					//出力用頂点データ

		//線分の始点
		element.svpos = input[0].svpos;		//頂点座標をコピー
		element.normal = input[0].normal;	//法線をコピー
		element.uv = input[0].uv;			//UVをコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);

		//線分の終点
		element.svpos = input[1].svpos;		//頂点座標をコピー
		element.normal = input[1].normal;	//法線をコピー
		element.uv = input[1].uv;			//UVをコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);
	//}
}