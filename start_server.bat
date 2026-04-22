@echo off
set "ARTIFACTS_PATH=%~dp0artifacts"
set "DATA_PATH=%~dp0server-data"
set "TXHOST_DATA_PATH=%~dp0txData"

echo Starting Omininola's vRP Server...
cd /d "%DATA_PATH%"

"%ARTIFACTS_PATH%\FXServer.exe"

pause