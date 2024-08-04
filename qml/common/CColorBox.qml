import QtQuick
import QtQuick.Dialogs

import Display

Rectangle {
    id: root
    border.color: {
        if (mouseArea.containsPress) return MyStyles.style.selected
        if (mouseArea.containsMouse) return MyStyles.style.hovered
        return MyStyles.style.border
    }
    border.width: MyStyles.style.width
    color: "#FFFFFF"
    radius: MyStyles.style.radius

    height: 40
    width: 60

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: dialog.open()
    }

    ColorDialog {
        id: dialog
        selectedColor: root.color
        onAccepted: root.color = selectedColor
    }
}
