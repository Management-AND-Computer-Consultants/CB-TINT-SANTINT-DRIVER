@echo off
echo Testing JitPack build configuration...

REM Check if gradle wrapper exists
if not exist "gradlew" (
    echo ❌ gradlew not found
    exit /b 1
)

if not exist "gradlew.bat" (
    echo ❌ gradlew.bat not found
    exit /b 1
)

if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo ❌ gradle-wrapper.jar not found
    exit /b 1
)

REM Check if AAR files exist
if not exist "santintdriver-release.aar" (
    echo ❌ santintdriver-release.aar not found
    exit /b 1
)

if not exist "spectrumdriver-release.aar" (
    echo ❌ spectrumdriver-release.aar not found
    exit /b 1
)

REM Test gradle wrapper
echo Testing gradle wrapper...
gradlew --version

if %ERRORLEVEL% equ 0 (
    echo ✅ Gradle wrapper working
) else (
    echo ❌ Gradle wrapper failed
    exit /b 1
)

REM Test build
echo Testing build...
gradlew clean assembleRelease

if %ERRORLEVEL% equ 0 (
    echo ✅ Build successful
    echo 🎉 Ready for JitPack publishing!
) else (
    echo ❌ Build failed
    exit /b 1
)
