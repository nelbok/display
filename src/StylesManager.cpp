#include "StylesManager.hpp"

StylesManager::StylesManager(QObject* parent)
    : QObject(parent) {}

StylesManager::~StylesManager() {}

void StylesManager::init() {
    { // Style Light
        Style style;
        // Qt warning: For improved performance use (255, 255, 255, 255) constructor instead of (#FFFFFFFF) constructor
        style.foreground = QColor("#FF000000");
        style.background = QColor("#FFDDDDDD");
        style.border = QColor("#FF000000");
        style.selected = QColor("#FF999999");
        style.hovered = QColor("#FF666666");
        _styles.append(std::move(style));
    }

    { // Style Dark
        Style style;
        // Qt warning: For improved performance use (255, 255, 255, 255) constructor instead of (#FFFFFFFF) constructor
        style.foreground = QColor("#FFDDDDDD");
        style.background = QColor("#FF000000");
        style.border = QColor("#FFDDDDDD");
        style.selected = QColor("#FF666666");
        style.hovered = QColor("#FF999999");
        _styles.append(std::move(style));
    }

    _current = 0;
}

qsizetype StylesManager::current() const {
    return _current;
}

void StylesManager::setCurrent(qsizetype current) {
    if (_current != current) {
        _current = current;
        emit currentUpdated();
    }
}

const Style& StylesManager::style() const {
    return _styles.at(_current);
}

const QList<Style>& StylesManager::styles() const {
    return _styles;
}
