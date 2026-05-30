import Quickshell
import QtQuick
import QtQuick.Effects
import "../../../Core"

Item {
    Image {
        id: logoImage

        source: "../../../assets/archlinux-logo.png"

        width: parent.width
        height: parent.height
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }
    MultiEffect {
        anchors.fill: logoImage
        source: logoImage

        colorization: 0.9
        colorizationColor: Colors.md3.primary
    }
}