# CB-TINT Santint Driver

A JitPack-ready Android library for Santint color matching and tinting systems.

## Features

- Santint AAR integration for color matching
- Tablet and mobile UI configurations
- Camera integration for color capture
- Bluetooth and serial communication support
- Comprehensive permission handling

## Installation

Add this to your project's `build.gradle`:

```gradle
allprojects {
    repositories {
        maven { url 'https://jitpack.io' }
    }
}
```

Add the dependency:

```gradle
dependencies {
    implementation 'com.github.YOUR_USERNAME:CB-TINT-SANTINT-DRIVER:1.0.0'
}
```

## Setup

### 1. AAR Authorization

The AAR must be authorized by Santint before use. This uses a one-machine-one-authorization method:

1. Obtain device ID from the AAR interface
2. Provide device ID to Santint
3. Receive authorization code for specified period
4. Register authorization code on the device

### 2. User Data Configuration

Extract `SanTint.rar` to the user data folder and ensure the path matches the configuration:

```java
// Example path configuration
context.getDir("userdata", 0)
```

### 3. Driver Configuration

Configure the service in your `AndroidManifest.xml` based on device type:

#### For Tablet/Android Box:
```xml
<activity
    android:name="com.santint.colorexpert.serviceui.Splash"
    android:alwaysRetainTaskState="true"
    android:icon="@drawable/ic_service"
    android:label="Service"
    android:process=":driver"
    android:screenOrientation="landscape"
    android:theme="@style/SplashTheme">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>
```

#### For Mobile:
```xml
<activity
    android:name="com.santint.colorexpert.phoneui.PhoneSplash"
    android:alwaysRetainTaskState="true"
    android:icon="@drawable/ic_service"
    android:label="Service"
    android:process=":santint"
    android:screenOrientation="portrait"
    android:theme="@style/PhoneSplashTheme">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>
```

### 4. Required Initialization

Initialize the following in your main application entry:

```java
// Set UI context for logging
GeneralMethod.UIContext = this;

// Set language path for Santint driver messages
GeneralMethod.LanguagePath = "path/to/language/files";

// Set log path
Logger.logPath = "path/to/logs";

// Set software name for log files
Logger.SoftWareName = "YourAppName";

// Initialize serial port communication (if needed)
WCHUARTManager.getInstance().init(this);
```

### 5. UI Configuration

Configure the UI type in `UserData/Driver/DispensersConfig.XML`:

- `SoftwareType = 9`: Tablet UI
- `SoftwareType = 19`: Mobile UI

## Dependencies

This library includes the following dependencies:

- AndroidX AppCompat 1.6.1
- AndroidX ConstraintLayout 2.1.4
- AndroidX GridLayout 1.0.0
- AndroidX Camera 1.3.0
- EventBus 3.3.1
- FastJSON 1.2.83
- EasyPermissions 3.0.0
- And more...

## Permissions

The library requires the following permissions:

- Camera access
- Storage read/write
- Internet access
- Bluetooth
- Location services
- Phone state
- And more...

## Usage

1. Initialize the library with required configuration
2. Set up proper UI type based on device
3. Handle authorization with Santint
4. Configure user data paths
5. Start using color matching features

## Requirements

- Android API 21+ (Android 5.0)
- Target SDK 33
- AndroidX dependencies

## License

This library is proprietary and requires authorization from Santint for commercial use.

## Support

For technical support and authorization, contact Santint directly.
