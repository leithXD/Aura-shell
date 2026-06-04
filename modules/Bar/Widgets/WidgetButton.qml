import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Effects
import qs.Core

Item {
    id: root
    property string iconName
    property string command

    Text {
        id: icon
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 10 * ShellState.scale
        text: root.iconName
        font.family: "Material Symbols Rounded"
        font.pointSize: 16 * ShellState.scale
        color: Colors.md3.on_surface
    }

    Text {
        id: textField
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 10 * ShellState.scale
        text: ""
        font.family: "Cascadia Nove NF"
        font.pointSize: 12 * ShellState.scale
        color: Colors.md3.on_surface
    }
    Process {
        id: widgetProcess
        running: true
        command: ["sh", "-c", root.command]
        stdout: StdioCollector {
            onStreamFinished: {
                textField.text = this.text;
                console.log(ShellState.scale);
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            widgetProcess.running = true;
        }
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
        }
    }
}
