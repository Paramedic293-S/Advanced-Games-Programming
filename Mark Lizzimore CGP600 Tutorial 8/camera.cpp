#include <windows.h>
#include <d3d11.h>
#include <d3dx11.h>
#include <dxerr.h>
#include <stdio.h>
#define _XM_NO_INTRINSICS_
#define XM_NO_ALIGNMENT
#include <xnamath.h>
#include "camera.h"

camera::camera(float initx, float inity, float initz, float camerarot)
{
	mx = initx;
	my = inity;
	mz = initz;

	m_camera_rotation = camerarot;

	mdx = sin(m_camera_rotation * (XM_PI / 180.0));
	mdz = cos(m_camera_rotation * (XM_PI / 180.0));

}

void camera::rotate(float rotatedegrees)
{
	m_camera_rotation * rotatedegrees;

	mdx = sin(m_camera_rotation * (XM_PI / 180.0));
	mdz = cos(m_camera_rotation * (XM_PI / 180.0));
}

void camera::forward(float distance)
{
	mx += distance * mdx;
	mz += distance *mdz;
}

void camera::up()
{
	
}

XMMATRIX camera::GetViewMatrix()
{
	m_position = XMVectorSet(mx, my, mz, 0.0);
	m_lookat = XMVectorSet(mx + mdx, my, mz + mdz, 0.0);
	m_up = XMVectorSet(0.0, 1.0, 0.0, 0.0);

	XMMATRIX view = XMMatrixLookAtLH(m_position, m_lookat, m_up);
	return view;
}