# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# Keep Santint Driver classes
-keep class com.santint.** { *; }
-keep class com.cbtint.santintdriver.** { *; }

# Keep EventBus classes
-keep class org.greenrobot.eventbus.** { *; }

# Keep FastJSON classes
-keep class com.alibaba.fastjson.** { *; }

# Keep permission classes
-keep class com.yanzhenjie.permission.** { *; }
-keep class pub.devrel.easypermissions.** { *; }

# Keep camera classes
-keep class androidx.camera.** { *; }

# Keep appcompat classes
-keep class androidx.appcompat.** { *; }

# Keep constraint layout classes
-keep class androidx.constraintlayout.** { *; }

# Keep grid layout classes
-keep class androidx.gridlayout.** { *; }

# Keep swipe menu classes
-keep class com.baoyz.swipemenulistview.** { *; }

# General Android rules
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep Parcelable classes
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep R class
-keep class **.R
-keep class **.R$* {
    <fields>;
}
