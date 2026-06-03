import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.Core

PanelWindow {
    id: dashboard
    visible: ShellState.dashOpened
    color: "transparent"
    WlrLayershell.namespace: "Dashboard"
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
    WlrLayershell.exclusiveZone: -1
    anchors.top: true
    implicitWidth: 1000
    implicitHeight: 600

    Rectangle {
        id: dashRect
        property bool hovered: false
        width: hovered ? 600 : 300
        height: hovered ? 200 : 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        radius: Theme.componentRadius
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
