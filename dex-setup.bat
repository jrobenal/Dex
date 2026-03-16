@echo off
REM Dex Sales — One-command setup for Amazon Kiro (Windows)
REM Run this once after cloning: dex-setup.bat

echo.
echo Dex Sales Setup
echo ====================================
echo.

REM Detect vault path
SET VAULT_PATH=%~dp0
REM Remove trailing backslash
IF "%VAULT_PATH:~-1%"=="\" SET VAULT_PATH=%VAULT_PATH:~0,-1%
echo Vault: %VAULT_PATH%
echo.

REM ── Python check ──────────────────────────────────────────────
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo [ERROR] Python not found.
    echo Download from https://www.python.org/downloads/
    echo IMPORTANT: Check "Add Python to PATH" during installation.
    pause
    exit /b 1
)
FOR /F "tokens=2" %%i IN ('python --version 2^>^&1') DO SET PYVER=%%i
echo OK Python: %PYVER%

REM ── Node.js check ─────────────────────────────────────────────
node --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo [ERROR] Node.js not found.
    echo Download the LTS version from https://nodejs.org/
    pause
    exit /b 1
)
FOR /F %%i IN ('node --version') DO SET NODEVER=%%i
echo OK Node.js: %NODEVER%
echo.

REM ── Install Python dependencies ───────────────────────────────
echo Installing Python dependencies...
python -m pip install --quiet --upgrade pip
python -m pip install --quiet --user "mcp>=1.0.0,<2.0.0" pyyaml python-dateutil
IF ERRORLEVEL 1 (
    echo [ERROR] Failed to install Python dependencies.
    echo Try running: python -m pip install --upgrade pip
    pause
    exit /b 1
)
echo OK Python dependencies installed

REM ── Install Node dependencies ─────────────────────────────────
echo Installing Node.js dependencies...
cd /d "%VAULT_PATH%"
npm install --silent
IF ERRORLEVEL 1 (
    echo [WARNING] npm install had issues. Setup continues.
)
echo OK Node.js dependencies installed

REM ── Bake VAULT_PATH into MCP config ──────────────────────────
echo Configuring MCP servers...
SET MCP_FILE=%VAULT_PATH%\.kiro\settings\mcp.json
IF EXIST "%MCP_FILE%" (
    python -c "
vault = r'%VAULT_PATH%'.replace('\\', '/')
with open(r'%MCP_FILE%') as f:
    content = f.read()
content = content.replace('${VAULT_PATH}', vault)
with open(r'%MCP_FILE%', 'w') as f:
    f.write(content)
print('MCP config updated')
"
) ELSE (
    echo [WARNING] mcp.json not found, skipping.
)
echo OK MCP servers configured

REM ── Set VAULT_PATH permanently ────────────────────────────────
setx VAULT_PATH "%VAULT_PATH%" >nul
echo OK VAULT_PATH set for all future sessions

echo.
echo ====================================
echo  Dex Sales is ready!
echo ====================================
echo.
echo  Next steps:
echo  1. Restart Kiro
echo  2. Open this folder in Kiro
echo  3. Type /getting-started in chat
echo.
pause
