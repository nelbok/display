import QtQuick

import Display

Item {

    Image {
        id: logo

        anchors.top: parent.top
        anchors.topMargin: parent.width / 4
        anchors.horizontalCenter: parent.horizontalCenter

        source: "qrc:/logo.svg"
        height: parent.width / 3
        width: parent.width / 3
    }

    CTextComboBox {
        id: style

        anchors.top: logo.bottom
        anchors.topMargin: parent.width / 4
        anchors.left: parent.left
        anchors.right: parent.right

        name: qsTr("Style:")
        model: ListModel {
            ListElement { name: qsTr("Light") }
            ListElement { name: qsTr("Dark") }
        }
        Component.onCompleted: currentIndex = MyStyles.current
        onActivated: MyStyles.current = currentIndex
    }

    CTextComboBox {
        id: language

        anchors.top: style.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        name: qsTr("Language:")
        model: ListModel {
            ListElement { name: qsTr("English") }
            ListElement { name: qsTr("French") }
        }
        Component.onCompleted: currentIndex = MyTranslators.current
        onActivated: MyTranslators.current = currentIndex
    }

    CTextSlider {
        id: fontSize

        anchors.top: language.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        name: qsTr("Point size:")
        from: 8
        to: 16
        stepSize: 0.5
        Component.onCompleted: value = MyStyles.font.pointSize
        onMoved: MyStyles.font.pointSize = value
    }
}
