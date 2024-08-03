import QtQuick
import QtQuick.Layouts

import Display

RowLayout {
    property alias name: name.text
    property alias from: slider.from
    property alias to: slider.to
    property alias value: slider.value
    property alias stepSize: slider.stepSize
    signal moved()

    CText {
        id: name
        Layout.preferredWidth: 120
        horizontalAlignment: Text.AlignRight
    }

    CSlider {
        id: slider
        Layout.fillWidth: true
        onMoved: parent.moved()
    }
}
