# Foxxy Soft Display

## About

A little project to show off

## Android

With Qt Creator, you can easily create a signed APK for your phone or any Android devices.

If you want to configure the AndroidManifest file, apart the fact to create one, you need to add those lines in your cmake file:

```
set_target_properties(appDisplay PROPERTIES
    ...
    QT_ANDROID_PACKAGE_SOURCE_DIR android
)

configure_file(android/AndroidManifest.xml android/AndroidManifest.xml COPYONLY)
```

`configure_file` with `COPYONLY` copies the file in the build dir. If you want to use parameters drop the `COPYONLY`.
See [CMake document about configure_file for more informations](https://cmake.org/cmake/help/latest/command/configure_file.html)

## Requirements

- CMake 3.27+
- C++ 17
- Qt6 Quick 

## Compilation

- cmake -B build
- cmake --build build

If you need to specify Qt location, add this to the first call of CMake: -D "CMAKE_PREFIX_PATH=Path to Qt"