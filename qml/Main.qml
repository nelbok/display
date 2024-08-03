import QtQuick

import Display

Window {
    width: 360
    height: 800
    visible: true
    title: "Display"

    Rectangle {
        property real blockHeight: height - 50 * (3 - 1) // Three CBlock

        anchors.fill: parent

        id: root
        color: "gray"

        CBlock {
            anchors.top: root.top
            anchors.left: root.left
            anchors.right: root.right
            anchors.margins: 5

            id: settings
            title: qsTr("Settings")
            heightMax: root.blockHeight
            collapsing: false

            onTitleClicked: switchBlock(settings)

            BSettings {
                visible: settings.expanded
                anchors.fill: settings.content
            }
        }

        CBlock {
            anchors.top: settings.bottom
            anchors.left: root.left
            anchors.right: root.right
            anchors.margins: 5

            id: components
            title: qsTr("Components")
            heightMax: root.blockHeight

            onTitleClicked: switchBlock(components)
        }

        CBlock {
            anchors.top: components.bottom
            anchors.bottom: root.bottom
            anchors.left: root.left
            anchors.right: root.right
            anchors.margins: 5

            id: view3D
            title: qsTr("3D view")
            heightMax: root.blockHeight

            onTitleClicked: switchBlock(view3D)
        }
    }

    function switchBlock(block) {
        settings.collapsing = settings !== block;
        components.collapsing = components !== block;
        view3D.collapsing = view3D !== block;
    }
}
