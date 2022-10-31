#include "BasicShaderHeader.hlsli"

//三角形→三角形を2つ出力するサンプル
//(途中でUV加工してタイリング)
[maxvertexcount(6)]//最大出力頂点数
void main(
	triangle VSOutput input[3] : SV_POSITION, //線とか色々ある
	//三角形ストリーム
	inout TriangleStream< GSOutput > output//ここで出力
)
{
	//三角形1つ目
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//出力用頂点データ
		//線分の始点
		element.svpos = input[i].svpos;		//頂点座標をコピー
		element.normal = input[i].normal;	//法線をコピー
		element.uv = input[i].uv;			//UVをコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);
	}
	//現在のストリップを終了
	output.RestartStrip();

	//三角形2つ目
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;					//出力用頂点データ
		//線分の始点
		element.svpos = input[i].svpos
			+ float4(20.0f, 0.0f, 0.0f, 0.0f);//頂点座標をX方向に20ずらす
		element.normal = input[i].normal;	//法線をコピー
		element.uv = input[i].uv * 5.0f;			//UVを5倍に
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);
	}
}