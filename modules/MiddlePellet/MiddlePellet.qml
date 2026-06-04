import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.Core

Variants {
    model: Quickshell.screens
    PanelWindow {
        id: dashboard
        visible: ShellState.dashOpened
        color: "transparent"
        WlrLayershell.namespace: "Dashboard"
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        WlrLayershell.exclusiveZone: -1
        property var modelData
        screen: modelData
        anchors.top: true
        implicitWidth: 1000 * ShellState.scale
        implicitHeight: 600 * ShellState.scale

        Rectangle {
            id: dashRect
            property bool hovered: false
            width: hovered ? 600 * ShellState.scale : 300 * ShellState.scale
            height: hovered ? 200 * ShellState.scale : 60 * ShellState.scale
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10 * ShellState.scale
            radius: Theme.componentRadius * ShellState.scale
            color: Theme.transparency(Colors.md3.surface, Config.transparency.surface)
            Behavior on width {
                NumberAnimation {
                    duration: 200
                    easing: Easing.OutCubic
                }
            }
            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing: Easing.OutCubic
                }
            }
            Clock {
                anchors.centerIn: parent
            }
        }

        mask: Region {
            item: dashRect
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                dashRect.hovered = true;
            }
            onExited: {
                dashRect.hovered = false;
            }
        }
    }
}
