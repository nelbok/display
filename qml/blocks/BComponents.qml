import QtQuick
import QtQuick.Layouts

import Display

import "../tools.js" as Tools

Item {

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
}
