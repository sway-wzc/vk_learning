@echo off
setlocal
cd /d "%~dp0"

REM dxc comes with the Vulkan SDK; locate it via the env var
set "DXC=%VK_SDK_PATH%\Bin\dxc.exe"
if not exist "%DXC%" (
    echo [ERROR] dxc.exe not found: "%DXC%"
    echo Please install the Vulkan SDK or set VK_SDK_PATH.
    exit /b 1
)

echo Compiling VertexShader.hlsl ...
"%DXC%" -spirv -fspv-target-env=vulkan1.0 -T vs_6_0 -E main -Fo VertexShader.spv VertexShader.hlsl
if errorlevel 1 (
    echo [ERROR] VertexShader compilation failed.
    exit /b 1
)

echo Compiling PixelShader.hlsl ...
"%DXC%" -spirv -fspv-target-env=vulkan1.0 -T ps_6_0 -E main -Fo PixelShader.spv PixelShader.hlsl
if errorlevel 1 (
    echo [ERROR] PixelShader compilation failed.
    exit /b 1
)

echo.
echo Done. Generated:
echo   VertexShader.spv
echo   PixelShader.spv
endlocal
