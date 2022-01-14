@echo off

@REM Get the key from the key.txt file
SET KEY_FILE=key.txt
IF NOT EXIST "%KEY_FILE%" (
  echo "No key file found"
  exit /b 1
)
SET /P KEY=< "%KEY_FILE%"

if "%~1"=="" (
    echo Usage: %~n0 dsn(member^)
    exit /b 1
)

zowe tso send as %KEY% --data "ex '%1'"