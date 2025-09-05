# JitPack Setup Guide

## Prerequisites

Before publishing to JitPack, ensure you have:

1. ✅ **GitHub Repository**: Your code is in a GitHub repository
2. ✅ **Gradle Wrapper**: Complete gradle wrapper setup
3. ✅ **AAR Files**: Santint AAR files are committed to the repository
4. ✅ **Proper Configuration**: All build files are properly configured

## Step 1: Complete Gradle Wrapper Setup

### Download gradle-wrapper.jar

You need to download the actual gradle-wrapper.jar file. Choose one of these methods:

#### Method A: Using Gradle (if installed)
```bash
gradle wrapper --gradle-version 7.5
```

#### Method B: Manual Download
1. Go to: https://github.com/gradle/gradle/raw/v7.5/gradle/wrapper/gradle-wrapper.jar
2. Download the file
3. Place it in `gradle/wrapper/gradle-wrapper.jar`

#### Method C: Using curl/wget
```bash
curl -L -o gradle/wrapper/gradle-wrapper.jar https://github.com/gradle/gradle/raw/v7.5/gradle/wrapper/gradle-wrapper.jar
```

### Verify Gradle Wrapper
```bash
./gradlew --version
```
Should show Gradle 7.5

## Step 2: Ensure AAR Files are Committed

Make sure these files are in your repository:
- `santintdriver-release.aar`
- `spectrumdriver-release.aar`

Check with:
```bash
git status
git add *.aar
git commit -m "Add AAR files for JitPack"
```

## Step 3: Test Local Build

Test the build locally before pushing to JitPack:

```bash
./gradlew clean
./gradlew assembleRelease
```

## Step 4: Push to GitHub

```bash
git add .
git commit -m "Prepare for JitPack publishing"
git push origin main
```

## Step 5: Create Release Tag

Create a release tag for versioning:

```bash
git tag v1.0.0
git push origin v1.0.0
```

## Step 6: Test with JitPack

1. Go to https://jitpack.io
2. Enter your GitHub repository URL
3. Click "Look up"
4. Click "Get it" next to your tag
5. Wait for the build to complete

## Step 7: Use in Your Project

Once JitPack build is successful, use in your project:

```gradle
allprojects {
    repositories {
        maven { url 'https://jitpack.io' }
    }
}

dependencies {
    implementation 'com.github.YOUR_USERNAME:CB-TINT-SANTINT-DRIVER:v1.0.0'
}
```

## Troubleshooting

### Common Issues:

1. **"Gradle wrapper not found"**
   - Ensure `gradlew`, `gradlew.bat`, and `gradle/wrapper/gradle-wrapper.jar` exist
   - Make sure gradle-wrapper.jar is the actual file, not just "PK"

2. **"AAR files not found"**
   - Ensure AAR files are committed to the repository
   - Check that they're not in .gitignore

3. **"Build failed"**
   - Check the JitPack build logs
   - Ensure all dependencies are available
   - Verify Android SDK version compatibility

4. **"Namespace not found"**
   - The namespace is already added to build.gradle
   - Ensure you're using Android Gradle Plugin 7.0+

### Build Logs

Check JitPack build logs at:
`https://jitpack.io/com/github/YOUR_USERNAME/CB-TINT-SANTINT-DRIVER/v1.0.0/build.log`

## File Structure

Your repository should have this structure:
```
CB-TINT-SANTINT-DRIVER/
├── build.gradle
├── settings.gradle
├── gradlew
├── gradlew.bat
├── jitpack.yml
├── README.md
├── USAGE.md
├── gradle/
│   └── wrapper/
│       ├── gradle-wrapper.properties
│       └── gradle-wrapper.jar
├── src/
│   └── main/
│       └── AndroidManifest.xml
├── santintdriver-release.aar
├── spectrumdriver-release.aar
└── proguard-rules.pro
```

## Next Steps

After successful JitPack publishing:

1. Update your React Native project to use the new dependency
2. Test the integration thoroughly
3. Document any additional setup requirements
4. Consider creating a React Native bridge module for easier integration

## Support

If you encounter issues:
1. Check JitPack build logs
2. Verify all files are properly committed
3. Test local builds first
4. Contact JitPack support if needed
