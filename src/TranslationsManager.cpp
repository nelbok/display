#include "TranslationsManager.hpp"

#include <QtCore/QCoreApplication>
#include <QtCore/QLocale>

TranslationsManager::TranslationsManager(QObject* parent)
    : QObject(parent) {}

TranslationsManager::~TranslationsManager() {}

void TranslationsManager::init() {
    { // Translator en
        auto* translator = new QTranslator(this);
        if (!translator->load(QLocale("en"), "app", "_", ":/translations")) {
            assert(!"Translation en not found");
        }
        _translators.append(translator);
    }

    { // Translator fr
        auto* translator = new QTranslator(this);
        if (!translator->load(QLocale("fr"), "app", "_", ":/translations")) {
            assert(!"Translation fr not found");
        }
        _translators.append(translator);
    }

    _current = 0;
    QCoreApplication::installTranslator(translator());
}

qsizetype TranslationsManager::current() const {
    return _current;
}

void TranslationsManager::setCurrent(qsizetype current) {
    if (_current != current) {
        _current = current;
        QCoreApplication::installTranslator(translator());
        emit currentUpdated();
    }
}

QTranslator* TranslationsManager::translator() const {
    return _translators.at(_current);
}

const QList<QTranslator*>& TranslationsManager::translators() const {
    return _translators;
}
