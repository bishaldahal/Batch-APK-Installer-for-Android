@echo off
setlocal enabledelayedexpansion

:: Ask the user for the path to aapt
set /p aaptPath="Enter the path to your aapt tool (e.g., E:\AndroidSdk\SDK\build-tools\30.0.3): "

:: Add the path to aapt to the PATH environment variable
set PATH=%PATH%;%aaptPath%

:: Check if aapt is accessible
aapt version >nul 2>&1 || (
    echo aapt not found in the provided path. Aborting.
    exit /b
)

:: Loop over all APK files in the current directory
for %%F in (*.apk) do (
    :: Extract the package name from the APK file
    for /f "delims=" %%A in ('aapt dump badging "%%F" ^| findstr /C:"package: name="') do (
        set "packageName=%%A"
    )

    :: Remove unnecessary parts from the package name string
    set "packageName=!packageName:~15!"
    for /f "delims=' tokens=1" %%A in ("!packageName!") do set "packageName=%%A"

    :: Check if the package is already installed
    for /f "delims=" %%B in ('adb shell pm list packages ^| findstr /C:"!packageName!"') do (
        set "installedPackage=%%B"
    )

    :: If the package is not installed, install it
    if "!installedPackage!"=="" (
        echo Installing !packageName!
        adb install "%%F"
    ) else (
        echo Skipping !packageName!, already installed.
    )
)

endlocal