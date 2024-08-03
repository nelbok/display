#pragma once

#include <QtCore/QList>
#include <QtCore/QObject>
#include <QtGui/QColor>

class Style {
    Q_GADGET

    Q_PROPERTY(QColor foreground MEMBER foreground)
    Q_PROPERTY(QColor background MEMBER background)
    Q_PROPERTY(QColor border MEMBER border)
    Q_PROPERTY(QColor selected MEMBER selected)
    Q_PROPERTY(QColor hovered MEMBER hovered)

    Q_PROPERTY(int pointSize MEMBER pointSize)
    Q_PROPERTY(int width MEMBER width)
    Q_PROPERTY(int radius MEMBER radius)

public:
    Style() = default;
    virtual ~Style() = default;

    QColor foreground{ 90, 7, 90 };
    QColor background{ 90, 7, 90 };
    QColor border{ 90, 7, 90 };
    QColor selected{ 90, 7, 90 };
    QColor hovered{ 90, 7, 90 };

    int pointSize{ 12 };
    int width{ 2 };
    int radius{ 5 };
};

class StylesManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(qsizetype current READ current WRITE setCurrent NOTIFY currentUpdated)
    Q_PROPERTY(const Style& style READ style NOTIFY currentUpdated)
    Q_PROPERTY(const QList<Style>& styles READ styles CONSTANT)

public:
    StylesManager(QObject* parent = nullptr);
    virtual ~StylesManager();

    void init();

    qsizetype current() const;
    void setCurrent(qsizetype current);

    const Style& style() const;
    const QList<Style>& styles() const;

private:
    qsizetype _current{ 0 };
    QList<Style> _styles{};

signals:
    void currentUpdated();
};
