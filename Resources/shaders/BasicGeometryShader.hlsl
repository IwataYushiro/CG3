#include "BasicShaderHeader.hlsli"

//三角形→三角形を出力するサンプル
//(途中でUV加工してタイリング)
[maxvertexcount(3)]//最大出力頂点数
void main(
	triangle VSOutput input[3] : SV_POSITION, //線とか色々ある
	//三角形ストリーム
	inout TriangleStream< GSOutput > output//ここで出力
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//出力用頂点データ
		//線分の始点
		element.svpos = input[i].svpos;		//頂点座標をコピー
		element.normal = input[i].normal;	//法線をコピー
		element.uv = input[i].uv*2.0f;			//UVを2倍に
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);
	}
	
}