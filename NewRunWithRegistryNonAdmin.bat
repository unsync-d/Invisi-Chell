@echo off

:: Set environment variables
set COR_ENABLE_PROFILING=1
set COR_PROFILER={cf0d821e-299b-5307-a3d8-b283c03916db}

:: Add registry keys and values using PowerShell (no UAC trigger)
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "New-Item -Path 'HKCU:\Software\Classes\CLSID\{cf0d821e-299b-5307-a3d8-b283c03916db}' -Force; " ^
  "New-Item -Path 'HKCU:\Software\Classes\CLSID\{cf0d821e-299b-5307-a3d8-b283c03916db}\InprocServer32' -Force; " ^
  "Set-ItemProperty -Path 'HKCU:\Software\Classes\CLSID\{cf0d821e-299b-5307-a3d8-b283c03916db}\InprocServer32' -Name '(default)' -Value '%~dp0InvisiShellProfiler.dll'"

:: Run PowerShell (no UAC trigger)
powershell 

:: Clear environment variables
set COR_ENABLE_PROFILING=
set COR_PROFILER=

:: Delete the registry keys using PowerShell (no UAC trigger)
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "Remove-Item -Path 'HKCU:\Software\Classes\CLSID\{cf0d821e-299b-5307-a3d8-b283c03916db}' -Recurse -Force"

@echo on