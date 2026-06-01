import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import qs.Core

PanelWindow {
    id: root
    visible: false
    implicitHeight: 1200
    implicitWidth: 1920
    color: Theme.transparency(Colors.md3.surface, transparencyValue)
    property bool isVisible: false
    property real transparencyValue: 0
    WlrLayershell.namespace: "Lock"

    Behavior on transparencyValue {
        NumberAnimation {
            duration: 400
            easing: Easing.OutCubic
        }
    }

    onIsVisibleChanged: {
        visible = isVisible;
        if (isVisible) {
            transparencyValue = 0.8;
        } else {
            transparencyValue = 0;
        }
    }

    IpcHandler {
        target: "lock"
        function toggle() {
            root.isVisible = !root.isVisible;
        }
    }
}
