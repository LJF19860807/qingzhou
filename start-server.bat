@echo off
chcp 65001 >nul
echo ============================================
echo   债务管家 APP - 本地启动
echo ============================================
echo.
echo 正在启动本地服务器...
echo 请在浏览器中打开: http://localhost:8080
echo.
echo 按 Ctrl+C 停止服务器
echo.

REM 尝试用 Python 启动
where python >nul 2>nul
if %errorlevel%==0 (
    echo [使用 Python HTTP 服务器]
    cd /d "%~dp0"
    python -m http.server 8080
    goto :eof
)

REM 尝试用 Python3 启动
where python3 >nul 2>nul
if %errorlevel%==0 (
    echo [使用 Python3 HTTP 服务器]
    cd /d "%~dp0"
    python3 -m http.server 8080
    goto :eof
)

REM 尝试用 npx serve
where npx >nul 2>nul
if %errorlevel%==0 (
    echo [使用 npx serve]
    cd /d "%~dp0"
    npx serve -l 8080
    goto :eof
)

echo [错误] 未找到 Python 或 Node.js
echo.
echo 请安装以下任一工具：
echo   1. Python: https://python.org
echo   2. Node.js: https://nodejs.org
echo.
echo 或者直接将 debt-app 文件夹部署到以下平台：
echo   - GitHub Pages (免费)
echo   - Vercel.com (免费)
echo   - Netlify.com (免费)
echo.
pause
