#include <QtGui/QGuiApplication>
#include <QtGui/QIcon>
#include <QtQml/QQmlApplicationEngine>

#include "StylesManager.hpp"
#include "TranslationsManager.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Foxxy Soft");
    app.setApplicationName("Display");
    app.setApplicationVersion("1.0");
    app.setWindowIcon(QIcon(":/logo.svg"));

    QQmlApplicationEngine engine;
    auto* sm = new StylesManager(&app);
    auto* tm = new TranslationsManager(&app);

    sm->init();
    tm->init();

    qmlRegisterSingletonInstance("Display", 1, 0, "MyStyles", sm);
    qmlRegisterSingletonInstance("Display", 1, 0, "MyTranslators", tm);

    // Translations
    QObject::connect(tm, &TranslationsManager::currentUpdated, &engine, &QQmlApplicationEngine::retranslate);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Display", "Main");

    return app.exec();
}
