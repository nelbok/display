import QtQuick
import QtQuick.Controls.Basic

import Display

RadioButton {
    palette.light: MyStyles.style.hovered // Backgroun circle pressed
    palette.base: MyStyles.style.background // Background circle
    palette.highlight: MyStyles.style.hovered
    palette.mid: MyStyles.style.border // Border circle
    palette.text: MyStyles.style.selected // Background selected
    palette.windowText: MyStyles.style.foreground // Foreground

    font.pointSize: MyStyles.font.pointSize
}
