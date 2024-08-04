# Styling

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