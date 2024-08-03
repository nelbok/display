import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

import Display

RowLayout {
    property alias name: name.text
    property alias from: slider.from
    property alias to: slider.to
    property alias value: slider.value
    property alias stepSize: slider.stepSize
    signal moved()

    Text {
        id: name

        Layout.preferredWidth: 120

        horizontalAlignment: Text.AlignRight

        color: MyStyles.style.foreground
        font.pointSize: MyStyles.font.pointSize
    }

    Slider {
        id: slider

        Layout.fillWidth: true

        snapMode: Slider.SnapOnRelease

        palette.mid: MyStyles.style.border // Indicator border color
        palette.light: MyStyles.style.selected // Indicator color, not pressed
        palette.window: MyStyles.style.background // Indicator color, pressed
        palette.dark: MyStyles.style.hovered // Left bar color
        palette.midlight: MyStyles.style.hovered // Right bar color

        onMoved: parent.moved()
    }
}
