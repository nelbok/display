#pragma once

#include <QtCore/QList>
#include <QtCore/QObject>
#include <QtCore/QTranslator>

class TranslationsManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(qsizetype current READ current WRITE setCurrent NOTIFY currentUpdated)
    Q_PROPERTY(QTranslator* translator READ translator NOTIFY currentUpdated)
    Q_PROPERTY(const QList<QTranslator*>& translators READ translators CONSTANT)

public:
    TranslationsManager(QObject* parent = nullptr);
    virtual ~TranslationsManager();

    void init();

    qsizetype current() const;
    void setCurrent(qsizetype current);

    QTranslator* translator() const;
    const QList<QTranslator*>& translators() const;

private:
    qsizetype _current{ 0 };
    QList<QTranslator*> _translators{};

signals:
    void currentUpdated();
};
