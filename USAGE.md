# CB-TINT Santint Driver - Usage Guide

## Quick Start

### 1. Add to your React Native project

In your React Native project's `android/app/build.gradle`:

```gradle
dependencies {
    implementation 'com.github.YOUR_USERNAME:CB-TINT-SANTINT-DRIVER:1.0.0'
}
```

### 2. Initialize in your MainApplication.java

```java
import com.cbtint.santintdriver.SantintDriverManager;

public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        
        // Initialize Santint Driver
        SantintDriverManager.getInstance().init(this);
        
        // Set required configuration
        GeneralMethod.UIContext = this;
        GeneralMethod.LanguagePath = getFilesDir().getAbsolutePath() + "/languages";
        Logger.logPath = getFilesDir().getAbsolutePath() + "/logs";
        Logger.SoftWareName = "YourAppName";
    }
}
```

### 3. Add permissions to AndroidManifest.xml

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

### 4. Configure device type

Add the appropriate activity configuration based on your device type:

#### For Tablets/Android Box:
```xml
<activity
    android:name="com.santint.colorexpert.serviceui.Splash"
    android:screenOrientation="landscape"
    android:process=":driver" />
```

#### For Mobile:
```xml
<activity
    android:name="com.santint.colorexpert.phoneui.PhoneSplash"
    android:screenOrientation="portrait"
    android:process=":santint" />
```

## React Native Integration

### 1. Create a native module

Create `SantintDriverModule.java`:

```java
package com.yourpackage.santintdriver;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

public class SantintDriverModule extends ReactContextBaseJavaModule {
    
    public SantintDriverModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }
    
    @Override
    public String getName() {
        return "SantintDriver";
    }
    
    @ReactMethod
    public void initializeDriver(Promise promise) {
        try {
            // Initialize Santint Driver
            SantintDriverManager.getInstance().init(getReactApplicationContext());
            promise.resolve("Driver initialized successfully");
        } catch (Exception e) {
            promise.reject("INIT_ERROR", e.getMessage());
        }
    }
    
    @ReactMethod
    public void getDeviceId(Promise promise) {
        try {
            String deviceId = SantintDriverManager.getInstance().getDeviceId();
            promise.resolve(deviceId);
        } catch (Exception e) {
            promise.reject("DEVICE_ID_ERROR", e.getMessage());
        }
    }
    
    @ReactMethod
    public void registerAuthorization(String authCode, Promise promise) {
        try {
            boolean success = SantintDriverManager.getInstance().registerAuthorization(authCode);
            promise.resolve(success);
        } catch (Exception e) {
            promise.reject("AUTH_ERROR", e.getMessage());
        }
    }
}
```

### 2. Create package class

Create `SantintDriverPackage.java`:

```java
package com.yourpackage.santintdriver;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SantintDriverPackage implements ReactPackage {
    
    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }
    
    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        List<NativeModule> modules = new ArrayList<>();
        modules.add(new SantintDriverModule(reactContext));
        return modules;
    }
}
```

### 3. Register in MainApplication.java

```java
@Override
protected List<ReactPackage> getPackages() {
    return Arrays.<ReactPackage>asList(
        new MainReactPackage(),
        new SantintDriverPackage() // Add this line
    );
}
```

### 4. Use in JavaScript

```javascript
import { NativeModules } from 'react-native';

const { SantintDriver } = NativeModules;

// Initialize the driver
const initializeDriver = async () => {
  try {
    const result = await SantintDriver.initializeDriver();
    console.log('Driver initialized:', result);
  } catch (error) {
    console.error('Failed to initialize driver:', error);
  }
};

// Get device ID for authorization
const getDeviceId = async () => {
  try {
    const deviceId = await SantintDriver.getDeviceId();
    console.log('Device ID:', deviceId);
    return deviceId;
  } catch (error) {
    console.error('Failed to get device ID:', error);
  }
};

// Register authorization code
const registerAuth = async (authCode) => {
  try {
    const success = await SantintDriver.registerAuthorization(authCode);
    console.log('Authorization registered:', success);
    return success;
  } catch (error) {
    console.error('Failed to register authorization:', error);
  }
};
```

## Authorization Process

1. **Get Device ID**: Call `getDeviceId()` to get the unique device identifier
2. **Contact Santint**: Send the device ID to Santint for authorization
3. **Receive Auth Code**: Santint will provide an authorization code
4. **Register Code**: Use `registerAuthorization(authCode)` to activate the driver

## Configuration

### User Data Setup

1. Extract `SanTint.rar` to your app's data directory
2. Ensure the path matches your configuration in `GeneralMethod.LanguagePath`

### UI Type Configuration

Set the UI type in `UserData/Driver/DispensersConfig.XML`:
- `SoftwareType = 9`: For tablets/Android boxes
- `SoftwareType = 19`: For mobile devices

## Troubleshooting

### Common Issues

1. **Permission Denied**: Ensure all required permissions are granted
2. **Authorization Failed**: Verify the authorization code is valid and not expired
3. **UI Not Displaying**: Check the SoftwareType configuration matches your device
4. **Camera Issues**: Ensure camera permissions are granted and camera is available

### Debug Logs

Check the logs in the configured log path for detailed error information.

## Support

For technical support and authorization requests, contact Santint directly.
