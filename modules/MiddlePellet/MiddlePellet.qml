import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.Core

PanelWindow {
    id: dashboard
    visible: ShellState.dashOpened
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "Dashboard"
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
    WlrLayershell.exclusiveZone: -1
    anchors.top: true
    implicitWidth: 1000
    implicitHeight: 600

    Rectangle {
        anchors.fill: parent
        color: Theme.transparency(Colors.md3.surface, Config.transparency.surface)
    }

    MouseArea {
        anchors.fill: parent
        z: -1
        onClicked: globalState.wallpaperMenuOpen = false
    }
}
