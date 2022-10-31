#include "BasicShaderHeader.hlsli"

//三角形→点を1つ出力するサンプル
[maxvertexcount(1)]//最大出力頂点数
void main(
	triangle VSOutput input[3] : SV_POSITION, //線とか色々ある

	//点ストリーム
	inout PointStream< GSOutput > output//ここで出力
)
{
	
		GSOutput element;					//出力用頂点データ
		element.svpos = input[0].svpos;		//頂点座標をコピー
		element.normal = input[0].normal;	//法線をコピー
		element.uv = input[0].uv;			//UVをコピー

		//頂点を1つ出力する(出力リストに追加)
		output.Append(element);
	
}