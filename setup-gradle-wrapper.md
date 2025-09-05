# Gradle Wrapper Setup

To complete the JitPack setup, you need to download the gradle-wrapper.jar file. Here are the steps:

## Option 1: Using Gradle (Recommended)

If you have Gradle installed locally, run:

```bash
gradle wrapper --gradle-version 7.5
```

## Option 2: Manual Download

Download the gradle-wrapper.jar from:
https://github.com/gradle/gradle/raw/v7.5/gradle/wrapper/gradle-wrapper.jar

And place it in the `gradle/wrapper/` directory.

## Option 3: Using the provided script

Run the download script:

```bash
chmod +x download-gradle-wrapper.sh
./download-gradle-wrapper.sh
```

## Verify Setup

After setting up the wrapper, verify it works:

```bash
./gradlew --version
```

This should show Gradle version 7.5.

## Important Notes

1. The AAR files (`santintdriver-release.aar` and `spectrumdriver-release.aar`) must be committed to your Git repository for JitPack to access them.

2. Make sure all files are committed and pushed to GitHub before testing with JitPack.

3. The gradle wrapper files (`gradlew`, `gradlew.bat`, and `gradle/wrapper/gradle-wrapper.jar`) are essential for JitPack builds.
