# Tutelar Flutter SDK

Tutelar are risk management experts. Our high powered tech-enabled solutions simplify fraud risk management and automates auxiliary business processes enabling companies to focus on its core products and services.

## Requirements
### Android
1. Use Android 6.0 (API level 23) and above.
2. Use Kotlin version 1.6.10 and above: example ```ext.kotlin_version = '1.6.10'```
3. _(optional)_ ```READ_PHONE_STATE``` permission for device_id
4. _(optional)_ ```ACCESS_FINE_LOCATION``` and ```ACCESS_COARSE_LOCATION``` for device location

### iOS
1. Use iOS 11.0 or higher
2. Use Swift version 5.0 and above
3. _(optional)_ ```Core Location permission``` for device location

> __Note:__ If the application does not have the listed permissions, the values collected using those permissions will be ignored. To provide a valid device fingerprint, we recommend employing as much permission as possible based on your use-case.

#### Step 1 - Installation

In the ```dependencies:``` section of your ```pubspec.yaml```, add the following line.
```
tutelarfluttersdk 1.0.1
```

#### Step 2 - Initialize SDK
Add the following line of code to initialise it with the api key you obtained from the Tutelar merchant panel. If you don't have a api key create new one.
```
Tutelar tutelar = Tutelar("YOUR API KEY");
```

#### Step 3 - Getting Device Info
By calling the following function to receive the device info shown below.
```
var sdkResponse = await tutelar.getDeviceDetails();
if(sdkResponse['success'] == true){
    var deviceDetail = response['data'];
    // Handle Success flow
}else{
    var failureMessage = response['message'];
     // Handle Failure flow
}
```
#### Step 4 - Update Permission for iOS  (optional)
If you are working with iOS Build, You have to add this permission in Info.plist.
```
// This is probably the only one you need. Background location is supported
// when the app is using location service while in the background.
NSLocationWhenInUseUsageDescription
```
#### Step 5 - Progurad Rules For Android (optional)
If you are using Proguard for your builds, include the Proguard rule with.
```
-keep,allowobfuscation,allowshrinking interface retrofit2.Call
-keep,allowobfuscation,allowshrinking class retrofit2.Response
-keep,allowobfuscation,allowshrinking class kotlin.coroutines.** { *; }

-dontwarn com.tutelarfluttersdk.**
-keep class com.tutelarfluttersdk.** {*;}
```
That's it for the integration, now send the obtained device fingerprint to the server.