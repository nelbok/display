import QtQuick
import QtQuick.Layouts
import QtQuick3D
import QtQuick3D.Helpers

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

        CColorBox {
            id: colorBox
        }
    }

    View3D {
        anchors.top: groupRadio.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5

        environment: SceneEnvironment {
            clearColor: "skyblue"
            backgroundMode: SceneEnvironment.Color
        }

        // A light like the sun
        DirectionalLight {
            eulerRotation.x: -30
            eulerRotation.y: -70
            castsShadow: true
            shadowFactor: 20
        }

        // Camera with its controller to make it easy to move around the cube
        camera: cameraNode
        Node {
            id: originNode
            position: Qt.vector3d(0, 0, 0)
            eulerRotation.x: -40
            eulerRotation.y: -80
            PerspectiveCamera {
                id: cameraNode
                position: Qt.vector3d(0, 0, 400)
            }
        }
        OrbitCameraController {
            anchors.fill: parent
            origin: originNode
            camera: cameraNode
            panEnabled: false
        }

        // Ground
        Model {
            position: Qt.vector3d(0, -250, 0)
            scale: Qt.vector3d(100, 1, 100)
            source: "#Cylinder"
            materials: PrincipledMaterial {
                baseColor: "green"
            }
        }

        // The cube
        Model {
            position: Qt.vector3d(0, 0, 0)
            scale: Qt.vector3d(1, 1, 1)
            source: "#Cube"
            materials: PrincipledMaterial {
                baseColor: colorBox.color
                baseColorMap: Texture {
                    id: texture
                    source: Tools.Textures.Board
                }
            }
        }
    }
}
