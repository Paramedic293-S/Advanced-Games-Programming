#include <windows.h>
#include <d3d11.h>
#include <d3dx11.h>
#include <dxerr.h>
#include <stdio.h>
#define _XM_NO_INTRINSICS_
#define XM_NO_ALIGNMENT
#include <xnamath.h>

class camera
{
private:

	float mx;
	float my;
	float mz;
	float mdx;
	float mdz;
	float mdy;
	float m_camera_rotation;

	XMVECTOR m_position = XMVectorSet(0.0, 0.0, -5.0, 0.0);
	XMVECTOR m_lookat = XMVectorSet(0.0, 0.0, -4.0, 0.0);
	XMVECTOR m_up = XMVectorSet(0.0, 1.0, 0.0, 0.0);

	XMMATRIX view = XMMatrixLookAtLH(m_position, m_lookat, m_up);

public:

	camera(float initx, float inity, float initz, float camerarot);
	void rotate(float rotatedegrees);
	void forward(float distance);
	void side(float sideways);
	void up(float length);
	XMMATRIX GetViewMatrix();

};
