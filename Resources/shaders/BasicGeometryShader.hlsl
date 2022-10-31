#include "BasicShaderHeader.hlsli"

//三角形→線分を3つ出力するサンプル
[maxvertexcount(6)]//最大出力頂点数
void main(
	triangle VSOutput input[3] : SV_POSITION, //線とか色々ある

	//点ストリーム
	inout LineStream< GSOutput > output//ここで出力
)
{

	GSOutput element;					//出力用頂点データ

	for (uint i = 0; i < 3; i++)
	{
		//線分の始点
		element.svpos = input[i].svpos;		//頂点座標をコピー
		element.normal = input[i].normal;	//法線をコピー
		element.uv = input[i].uv;			//UVをコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);

		//線分の終点
		if (i == 2)
		{
			//+1すると溢れるので、最初に戻る
			element.svpos = input[0].svpos;		//頂点座標をコピー
			element.normal = input[0].normal;	//法線をコピー
			element.uv = input[0].uv;			//UVをコピー
		}
		else
		{
			element.svpos = input[i+1].svpos;		//頂点座標をコピー
			element.normal = input[i+1].normal;	//法線をコピー
			element.uv = input[i+1].uv;			//UVをコピー
		}
		
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);
		//現在のストリップを終了し、次のストリップを開始
		output.RestartStrip();
		
	}
}