#include "BasicShaderHeader.hlsli"

//点→三角形を出力するサンプル
[maxvertexcount(3)]//最大出力頂点数
void main(
	point VSOutput input[1] : SV_POSITION, //線とか色々ある
	//三角形ストリーム
	inout TriangleStream< GSOutput > output//ここで出力
)
{
	
		GSOutput element;					//出力用頂点データ
		//頂点情報
		//共通
		element.normal = input[0].normal;	//法線をコピー
		element.uv = input[0].uv;			//UVをコピー
		
		//1点目
		element.svpos = input[0].svpos;		//頂点座標をコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);

		//2点目
		element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0.0f, 0.0f);		//頂点座標をコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);

		//3点目
		element.svpos = input[0].svpos + float4(10.0f, 0.0f, 0.0f, 0.0f);		//頂点座標をコピー
		//頂点を1個出力する(出力リストに追加)
		output.Append(element);
}