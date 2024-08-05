# Android

With Qt Creator, you can easily create a signed APK for your phone or any Android devices.

## Configure Qt Creator

Qt Creator has an automated feature to configure and install Android SDK. Though it can fail between versions. Here what I am using right now.

- Eclipse Adoptium: jdk-17.0.10.7-hotspot
- Android SDK:

![Display screenshot](/docs/Android-Manager.png)

## CMake file

If you want to configure the AndroidManifest file, apart the fact to create one, you need to add those lines in your CMake file:

```
set_target_properties(appDisplay PROPERTIES
    ...
    QT_ANDROID_PACKAGE_SOURCE_DIR android
)

configure_file(android/AndroidManifest.xml android/AndroidManifest.xml COPYONLY)
```

`configure_file` with `COPYONLY` copies the file in the build dir. If you want to use parameters drop the `COPYONLY`.
See [CMake document about configure_file for more information](https://cmake.org/cmake/help/latest/command/configure_file.html)

## Sign APK

![Display screenshot](/docs/Android-SignAPK.png)

You can either set or `create` your own keystore. Though, PlayStore will warn you that you are installing an unknown APK in case it doesn't know the keystore.

To install on your phone, you need to build in release AND to sign the APK or it will fail to install.

Don't forgot to check the `Sign package` box.