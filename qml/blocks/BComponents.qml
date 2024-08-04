import QtQuick
import QtQuick.Layouts

import Display

import "../tools.js" as Tools

Item {
    id: root

    RowLayout {
        id: groupRadio

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        CRadioButton {
            checked: true
            onToggled: texture.source = Tools.Textures.Board
        }

        CRadioButton {
            onToggled: texture.source = Tools.Textures.Circle
        }

        CRadioButton {
            onToggled: texture.source = Tools.Textures.Diamond
        }

        CRadioButton {
            onToggled: texture.source = Tools.Textures.Triangle
        }
    }

    Rectangle{
        id: rectTexture
        anchors.top: groupRadio.top
        anchors.topMargin: parent.width / 4
        anchors.horizontalCenter: parent.horizontalCenter

        height: parent.width / 3
        width: parent.width / 3

        border.color: MyStyles.style.border
        border.width: MyStyles.style.width

        Image {
            id: texture
            anchors.fill: parent
            anchors.margins: MyStyles.style.width
            source: Tools.Textures.Board
        }
    }

    Repeater {
        model: [0, 45, 90, 135, 180, 225, 270, 315]
        delegate: Item {
            anchors.top: rectTexture.bottom
            anchors.topMargin: parent.width / 4
            anchors.horizontalCenter: parent.horizontalCenter

            height: root.width / 3
            width: root.width / 3

            RotationAnimation on rotation {
                loops: Animation.Infinite
                from: 0 + modelData
                to: 360 + modelData
                duration: 5000
            }

            Rectangle {
                x: root.width / 6 - 10

                width: 20
                height: 20
                radius: 20

                border.color: MyStyles.style.border
                border.width: MyStyles.style.width
                color: MyStyles.style.background
            }
        }
    }

}
