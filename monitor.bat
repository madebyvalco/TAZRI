@echo off
title TAZRI - Instance Monitor ^| @madebyvalco
mode con: cols=45 lines=10
COLOR 6

setlocal enabledelayedexpansion
echo Monitoring Roblox instances...

set "logged_pids="

:monitor_loop
tasklist /fi "imagename eq RobloxPlayerBeta.exe" /fo table /nh | findstr /i /c:"RobloxPlayerBeta.exe" > nul
if %errorlevel%==0 (
    for /f "tokens=2" %%a in ('tasklist /fi "imagename eq RobloxPlayerBeta.exe" /fo table /nh') do (
        set "pid=%%a"

        echo !logged_pids! | findstr /c:"!pid!" > nul
        if errorlevel 1 (
            echo [+] New Roblox Instance PID: !pid!
            set "logged_pids=!logged_pids!!pid! "
        )
    )
) else (
    if not "!logged_pids!"=="" (
        echo [+] All Roblox instances have been closed.
    )
    set "logged_pids="
)
timeout /t 2 /nobreak >nul
goto monitor_loop
