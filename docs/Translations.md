# Translations

With Qt6 and cmake, you can easily create translation files with a simple line:

`qt_add_translations(appDisplay TS_FILES app_en.ts app_fr.ts... RESOURCE_PREFIX "/translations")`

Don't forget to add `LinguistTools` to the `find_package` line.

To update translation files, only one command is needed:

`cmake --build build --target update_translations`

For more informations, [qt_add_translations documentation](https://doc.qt.io/qt-6/qtlinguist-cmake-qt-add-translations.html)

With that done, you only need a manager such as [TranslationsManager](https://github.com/nelbok/display/blob/main/src/TranslationsManager.hpp), for multiple translations.

Even if you install a translation, the QML engine will not automatically translate your application, you need to tell the engine to update. It is done with a simple connect:

`QObject::connect(myTranslationsManagerInstance, &TranslationsManager::currentUpdated, &engine, &QQmlApplicationEngine::retranslate);`