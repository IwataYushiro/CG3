#include "BasicShaderHeader.hlsli"

//四角形の頂点数
static const uint vnum = 4;

//センターからのオフセット
static const float4 offset_array[vnum] = {
	float4(-0.5f,-0.5f,0.0f,0.0f),		//左下
	float4(-0.5f,+0.5f,0.0f,0.0f),		//左上
	float4(+0.5f,-0.5f,0.0f,0.0f),		//右下
	float4(+0.5f,+0.5f,0.0f,0.0f)		//右上
};

//点→四角形を出力する
[maxvertexcount(vnum)]//最大出力頂点数
void main(
	point VSOutput input[1] : SV_POSITION, //線とか色々ある
	//三角形ストリーム
	inout TriangleStream< GSOutput > output//ここで出力
)
{
		GSOutput element;					//出力用頂点データ
		//4点分まわす
		for (uint i = 0; i < vnum; i++) {
			//ワールド座標ベースで、ずらす
			element.svpos = input[0].pos + offset_array[i];
			//ビュー、射影変換
			element.svpos = mul(mat, element.svpos);
			element.uv = float2(0.5f, 0.5f);
			//頂点を1個出力する(出力リストに追加)
			output.Append(element);
		}
		
		
}