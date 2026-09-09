@echo off
setlocal
cd /d "%~dp0"

REM glslangValidator comes with the Vulkan SDK; locate it via the env var
set "GLSLANG=%VK_SDK_PATH%\Bin\glslangValidator.exe"
if not exist "%GLSLANG%" (
    echo [ERROR] glslangValidator.exe not found: "%GLSLANG%"
    echo Please install the Vulkan SDK or set VK_SDK_PATH.
    exit /b 1
)

echo Compiling VertexShader.vert ...
"%GLSLANG%" -V VertexShader.vert -o VertexShader.spv
if errorlevel 1 (
    echo [ERROR] VertexShader compilation failed.
    exit /b 1
)

echo Compiling PixelShader.frag ...
"%GLSLANG%" -V PixelShader.frag -o PixelShader.spv
if errorlevel 1 (
    echo [ERROR] PixelShader compilation failed.
    exit /b 1
)

echo.
echo Done. Generated:
echo   VertexShader.spv
echo   PixelShader.spv
endlocal
