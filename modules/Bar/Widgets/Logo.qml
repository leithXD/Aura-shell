import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Effects
import qs.Core

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
    Rectangle {
        anchors.fill: parent
        radius: 10 * ShellState.scale
        color: Colors.md3.on_surface
        opacity: 0
        Behavior on opacity {
            NumberAnimation {
                duration: 100
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.opacity = 0.1;
            }
            onExited: {
                parent.opacity = 0;
            }
            onClicked: {
                nextWall.running = true;
            }
            Process {
                id: nextWall
                command: ["sh", "-c", "nextWall"]
                running: false
            }
        }
    }
}
