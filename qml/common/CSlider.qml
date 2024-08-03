import QtQuick
import QtQuick.Controls.Basic

import Display

Slider {
    palette.mid: MyStyles.style.border // Indicator border color
    palette.light: MyStyles.style.selected // Indicator color, not pressed
    palette.window: MyStyles.style.background // Indicator color, pressed
    palette.dark: MyStyles.style.hovered // Left bar color
    palette.midlight: MyStyles.style.hovered // Right bar color
}
