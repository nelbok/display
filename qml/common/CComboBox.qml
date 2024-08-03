import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

import Display

RowLayout {
    property alias name: name.text
    property alias model: comboBox.model
    property alias currentIndex: comboBox.currentIndex
    signal activated()

    Text {
        id: name

        Layout.preferredWidth: 120

        horizontalAlignment: Text.AlignRight

        color: MyStyles.style.foreground
        font.pointSize: MyStyles.font.pointSize
    }

    ComboBox {
        id: comboBox

        Layout.fillWidth: true

        textRole: "name"

        // FIXME: Colors for hovered item in the popup

        palette.text: MyStyles.style.foreground // Foreground popup
        palette.buttonText: MyStyles.style.foreground // Foreground text
        palette.button: MyStyles.style.background // Background color
        palette.mid: MyStyles.style.background // Button background color when popup shown
        palette.window: MyStyles.style.background // Popup background color
        palette.dark: MyStyles.style.foreground // Foreground indicator

        font.pointSize: MyStyles.font.pointSize

        onActivated: parent.activated()
    }
}
