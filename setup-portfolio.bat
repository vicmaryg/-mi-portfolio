@echo off
echo ========================================
echo    CONFIGURACION DEL PORTAFOLIO
echo ========================================
echo.

echo Verificando archivos necesarios...
if not exist "portfolio.html" (
    echo ERROR: No se encuentra portfolio.html
    echo Asegurate de que todos los archivos esten en la misma carpeta
    pause
    exit /b 1
)

if not exist "styles\portfolio.css" (
    echo ERROR: No se encuentra styles\portfolio.css
    pause
    exit /b 1
)

if not exist "js\portfolio.js" (
    echo ERROR: No se encuentra js\portfolio.js
    pause
    exit /b 1
)

echo ✓ Todos los archivos estan presentes
echo.

echo ========================================
echo    OPCIONES DE EJECUCION
echo ========================================
echo.
echo 1. Abrir directamente en el navegador
echo 2. Iniciar servidor local con Python
echo 3. Iniciar servidor local con Node.js
echo 4. Iniciar servidor local con PHP
echo 5. Abrir en VS Code (si esta instalado)
echo 6. Salir
echo.

set /p choice="Selecciona una opcion (1-6): "

if "%choice%"=="1" goto open_direct
if "%choice%"=="2" goto python_server
if "%choice%"=="3" goto node_server
if "%choice%"=="4" goto php_server
if "%choice%"=="5" goto vscode
if "%choice%"=="6" goto exit

echo Opcion invalida
pause
exit /b 1

:open_direct
echo.
echo Abriendo portfolio.html en el navegador...
start portfolio.html
echo ✓ Portafolio abierto en el navegador
echo.
echo URL: file:///%cd%/portfolio.html
echo.
pause
goto exit

:python_server
echo.
echo Verificando si Python esta instalado...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python no esta instalado
    echo Descarga Python desde: https://python.org
    pause
    exit /b 1
)

echo ✓ Python encontrado
echo.
echo Iniciando servidor local con Python...
echo Puerto: 8000
echo URL: http://localhost:8000/portfolio.html
echo.
echo Presiona Ctrl+C para detener el servidor
echo.
python -m http.server 8000
goto exit

:node_server
echo.
echo Verificando si Node.js esta instalado...
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js no esta instalado
    echo Descarga Node.js desde: https://nodejs.org
    pause
    exit /b 1
)

echo ✓ Node.js encontrado
echo.
echo Instalando http-server...
npm install -g http-server
echo.
echo Iniciando servidor local con Node.js...
echo Puerto: 8080
echo URL: http://localhost:8080/portfolio.html
echo.
echo Presiona Ctrl+C para detener el servidor
echo.
http-server -p 8080
goto exit

:php_server
echo.
echo Verificando si PHP esta instalado...
php --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: PHP no esta instalado
    echo Descarga PHP desde: https://php.net
    pause
    exit /b 1
)

echo ✓ PHP encontrado
echo.
echo Iniciando servidor local con PHP...
echo Puerto: 8000
echo URL: http://localhost:8000/portfolio.html
echo.
echo Presiona Ctrl+C para detener el servidor
echo.
php -S localhost:8000
goto exit

:vscode
echo.
echo Verificando si VS Code esta instalado...
code --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: VS Code no esta instalado
    echo Descarga VS Code desde: https://code.visualstudio.com
    pause
    exit /b 1
)

echo ✓ VS Code encontrado
echo.
echo Abriendo proyecto en VS Code...
code .
echo.
echo Para usar Live Server:
echo 1. Instala la extension "Live Server"
echo 2. Click derecho en portfolio.html
echo 3. Selecciona "Open with Live Server"
echo.
pause
goto exit

:exit
echo.
echo ========================================
echo    CONFIGURACION COMPLETADA
echo ========================================
echo.
echo Recuerda personalizar:
echo - Tu informacion de contacto
echo - Enlaces a redes sociales
echo - Descripcion del proyecto
echo.
echo Archivos importantes:
echo - portfolio.html (pagina principal)
echo - styles/portfolio.css (estilos)
echo - js/portfolio.js (funcionalidades)
echo - PORTFOLIO_README.md (documentacion)
echo.
echo ¡Gracias por usar este portafolio!
pause
