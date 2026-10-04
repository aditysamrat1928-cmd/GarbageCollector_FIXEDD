@echo off
setlocal
cd /d "%~dp0"
title Garbage Collector - Windows Builder

echo ================================================
echo   GARBAGE COLLECTOR - WINDOWS EXE BUILDER
echo ================================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js is not installed.
  echo Please install Node.js LTS, then run this file again.
  echo.
  pause
  exit /b 1
)

where npm >nul 2>nul
if errorlevel 1 (
  echo [ERROR] npm is not available.
  echo Please reinstall Node.js LTS and try again.
  echo.
  pause
  exit /b 1
)

echo [1/3] Installing dependencies...
npm install
if errorlevel 1 goto :error

echo.
echo [2/3] Building Windows application...
npm run dist:win
if errorlevel 1 goto :error

echo.
echo [3/3] Build completed.
echo.
echo Look inside the "dist" folder for the Windows installer/executable.
echo.
explorer "%~dp0dist"
pause
exit /b 0

:error
echo.
echo ================================================
echo BUILD FAILED
 echo ================================================
echo Check the error shown above.
echo.
pause
exit /b 1
