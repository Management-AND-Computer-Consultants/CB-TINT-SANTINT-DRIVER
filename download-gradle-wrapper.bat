@echo off
echo Downloading gradle-wrapper.jar...

REM Try to download using PowerShell
powershell -Command "try { Invoke-WebRequest -Uri 'https://github.com/gradle/gradle/raw/v7.5/gradle/wrapper/gradle-wrapper.jar' -OutFile 'gradle/wrapper/gradle-wrapper.jar' -UseBasicParsing; Write-Host 'Download successful' } catch { Write-Host 'Download failed: ' $_.Exception.Message; Write-Host 'Please download manually from: https://github.com/gradle/gradle/raw/v7.5/gradle/wrapper/gradle-wrapper.jar' }"

REM Check if download was successful
if exist "gradle\wrapper\gradle-wrapper.jar" (
    echo Checking file size...
    for %%A in ("gradle\wrapper\gradle-wrapper.jar") do echo File size: %%~zA bytes
    
    REM Test if it's a valid JAR
    echo Testing gradle wrapper...
    gradlew --version
    if %ERRORLEVEL% equ 0 (
        echo ✅ Gradle wrapper is working!
    ) else (
        echo ❌ Gradle wrapper test failed
    )
) else (
    echo ❌ Download failed
    echo Please download manually from: https://github.com/gradle/gradle/raw/v7.5/gradle/wrapper/gradle-wrapper.jar
)

pause
