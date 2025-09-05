#!/bin/bash

echo "Testing JitPack build configuration..."

# Check if gradle wrapper exists
if [ ! -f "gradlew" ]; then
    echo "❌ gradlew not found"
    exit 1
fi

if [ ! -f "gradlew.bat" ]; then
    echo "❌ gradlew.bat not found"
    exit 1
fi

if [ ! -f "gradle/wrapper/gradle-wrapper.jar" ]; then
    echo "❌ gradle-wrapper.jar not found"
    exit 1
fi

# Check if AAR files exist
if [ ! -f "santintdriver-release.aar" ]; then
    echo "❌ santintdriver-release.aar not found"
    exit 1
fi

if [ ! -f "spectrumdriver-release.aar" ]; then
    echo "❌ spectrumdriver-release.aar not found"
    exit 1
fi

# Make gradlew executable
chmod +x gradlew

# Test gradle wrapper
echo "Testing gradle wrapper..."
./gradlew --version

if [ $? -eq 0 ]; then
    echo "✅ Gradle wrapper working"
else
    echo "❌ Gradle wrapper failed"
    exit 1
fi

# Test build
echo "Testing build..."
./gradlew clean assembleRelease

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
    echo "🎉 Ready for JitPack publishing!"
else
    echo "❌ Build failed"
    exit 1
fi
