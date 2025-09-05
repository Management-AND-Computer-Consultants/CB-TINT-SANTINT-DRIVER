#!/bin/bash

# Download gradle wrapper jar
GRADLE_VERSION="7.5"
WRAPPER_JAR_URL="https://github.com/gradle/gradle/raw/v${GRADLE_VERSION}/gradle/wrapper/gradle-wrapper.jar"

echo "Downloading gradle wrapper jar..."
curl -L -o gradle/wrapper/gradle-wrapper.jar "$WRAPPER_JAR_URL"

if [ $? -eq 0 ]; then
    echo "Gradle wrapper jar downloaded successfully"
else
    echo "Failed to download gradle wrapper jar"
    exit 1
fi
