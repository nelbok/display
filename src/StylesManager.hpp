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

    int width{ 2 };
    int radius{ 5 };
};

class Font : public QObject {
    Q_OBJECT
    Q_PROPERTY(double pointSize READ pointSize WRITE setPointSize NOTIFY pointSizeUpdated)

public:
    Font(QObject* parent = nullptr);
    virtual ~Font();

    double pointSize() const;
    void setPointSize(double current);

private:
    double _pointSize{ 12 };

signals:
    void pointSizeUpdated();
};

class StylesManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(qsizetype current READ current WRITE setCurrent NOTIFY currentUpdated)
    Q_PROPERTY(const Style& style READ style NOTIFY currentUpdated)
    Q_PROPERTY(const QList<Style>& styles READ styles CONSTANT)
    Q_PROPERTY(Font* font READ font CONSTANT)

public:
    StylesManager(QObject* parent = nullptr);
    virtual ~StylesManager();

    void init();

    qsizetype current() const;
    void setCurrent(qsizetype current);

    const Style& style() const;
    const QList<Style>& styles() const;

    Font* font() const;

private:
    qsizetype _current{ 0 };
    QList<Style> _styles{};
    Font* _font{ nullptr };

signals:
    void currentUpdated();
};
