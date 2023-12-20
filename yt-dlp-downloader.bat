@echo off
setlocal enabledelayedexpansion

REM Ask for input directory (where yt-dlp.exe is located)
set /p input_dir="Enter the directory where yt-dlp.exe is located (or press Enter to use PATH): "

if not "%input_dir%"=="" (
    if not exist "%input_dir%\yt-dlp.exe" (
        echo ERROR: yt-dlp.exe not found in the specified directory.
        pause
        exit /b
    )
    set yt_dlp="%input_dir%\yt-dlp.exe"
) else (
    set yt_dlp=yt-dlp
)

REM Ask for YouTube link
set /p yt_link="Enter the YouTube link: "

REM Run yt-dlp with the specified audio parameters
%yt_dlp% -x --audio-format mp3 "%yt_link%"

echo Download complete.
pause
