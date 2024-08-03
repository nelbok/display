# Foxxy Soft Display

## About

A little project to show off

## Features

### Android

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
See [CMake document about configure_file for more information](https://cmake.org/cmake/help/latest/command/configure_file.html)


### Styling

There are many ways to do that, let's see two ways for now:

- [Singleton QML](https://doc.qt.io/qt-6/qml-singleton.html): Easy to implement and you need to modify only the front. Good if you only need one style.

- Having a manager, like [StylesManager](https://github.com/nelbok/display/blob/main/src/StylesManager.hpp), for multiple styles.

The most important code there is:

`Q_PROPERTY(const Style& style READ style NOTIFY currentUpdated)`

When you change between styles, `currentUpdated` will notify the QML engine that style has been modifier and reload part of the interface.

Look at [CComboBox](https://github.com/nelbok/display/blob/main/qml/common/CComboBox.qml), you can see `MyStyle.current...` used everywhere it is needed.

JSon files isn't used for this project but you could load the style through them when you switch styles.

And to be able to use it with the QML engine, register StylesManager's instance:

`qmlRegisterSingletonInstance("Display", 1, 0, "MyStyles", myStylesManagerInstance);`


### Translations

With Qt6 and cmake, you can easily create translation files with a simple line:

`qt_add_translations(appDisplay TS_FILES app_en.ts app_fr.ts... RESOURCE_PREFIX "/translations")`

Don't forget to add `LinguistTools` to the `find_package` line.

To update translation files, only one command is needed:

`cmake --build build --target update_translations`

For more informations, [qt_add_translations documentation](https://doc.qt.io/qt-6/qtlinguist-cmake-qt-add-translations.html)

With that done, you only need a manager such as [TranslationsManager](https://github.com/nelbok/display/blob/main/src/TranslationsManager.hpp), for multiple translations.

Even if you install a translation, the QML engine will not automatically translate your application, you need to tell the engine to update. It is done with a simple connect:

`QObject::connect(myTranslationsManagerInstance, &TranslationsManager::currentUpdated, &engine, &QQmlApplicationEngine::retranslate);`

## Requirements

- CMake 3.27+
- C++ 17
- Qt6 Quick 

## Compilation

- cmake -B build
- cmake --build build

If you need to specify Qt location, add this to the first call of CMake: -D "CMAKE_PREFIX_PATH=Path to Qt"
