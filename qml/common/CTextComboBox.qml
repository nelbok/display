import QtQuick
import QtQuick.Layouts

import Display

RowLayout {
    property alias name: name.text
    property alias model: comboBox.model
    property alias currentIndex: comboBox.currentIndex
    signal activated()

    CText {
        id: name
        Layout.preferredWidth: 120
        horizontalAlignment: Text.AlignRight
    }

    CComboBox {
        id: comboBox
        Layout.fillWidth: true
        textRole: "name"
        onActivated: parent.activated()
    }
}
