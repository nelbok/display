import QtQuick
import QtQuick.Layouts

import Display

Item {
    Item {
        id: logo

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: width / 3

        Image {
            source: "qrc:/logo.svg"

            anchors.centerIn: parent

            height: parent.height
            width: parent.height
        }
    }

    ColumnLayout {
        anchors.top: logo.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        CComboBox {
            name: qsTr("Style:")
            model: ListModel {
                ListElement { name: qsTr("Light") }
                ListElement { name: qsTr("Dark") }
            }
            Component.onCompleted: currentIndex = MyStyles.current
            onActivated: MyStyles.current = currentIndex
        }

        CComboBox {
            name: qsTr("Language:")
            model: ListModel {
                ListElement { name: qsTr("English") }
                ListElement { name: qsTr("French") }
            }
            Component.onCompleted: currentIndex = MyTranslators.current
            onActivated: MyTranslators.current = currentIndex
        }

        CSlider {
            name: qsTr("Point size:")
            from: 8
            to: 16
            stepSize: 0.5
            Component.onCompleted: value = MyStyles.font.pointSize
            onMoved: MyStyles.font.pointSize = value
        }
    }
}
