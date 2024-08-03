import QtQuick

import Display

Rectangle {
    property real heightMin: 40
    property real heightMax: 200
    property bool collapsing: true
    property bool collapsed: height === heightMin
    property bool expanded: height === heightMax
    property alias title: title.text
    property alias content: innerContent
    signal titleClicked()

    id: root

    border.color: {
        if (titleArea.containsPress || !collapsed) return MyStyles.style.selected
        if (titleArea.containsMouse) return MyStyles.style.hovered
        return MyStyles.style.border
    }
    border.width: MyStyles.style.width
    color: MyStyles.style.background
    radius: MyStyles.style.radius

    height: (collapsing) ? heightMin : heightMax

    MouseArea {
        anchors.fill: parent

        // Avoid 3D View to catch mouse events
        preventStealing: true
    }

    Behavior on height {
        NumberAnimation { duration: 300 }
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 5

        text: parent.title
        font.pointSize: MyStyles.font.pointSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: MyStyles.style.foreground
        height: parent.heightMin - 10

        MouseArea {
            id: titleArea

            anchors.fill: parent

            hoverEnabled: true
            acceptedButtons: Qt.LeftButton

            // Avoid 3D View to catch mouse events
            preventStealing: true

            onClicked: {
                root.titleClicked()
                root.focus = true
            }
        }
    }

    Rectangle {
        id: line
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.right: parent.right
        anchors.rightMargin: 2

        height: 2

        color: MyStyles.style.foreground
        visible: parent.expanded
    }

    Item {
        id: innerContent
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 5
    }
}
