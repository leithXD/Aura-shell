import Quickshell
import Quickshell.Io
import QtQuick
import qs.Core

PanelWindow {
    id: root
    visible: false
    anchors {
        right: true
        left: true
        top: true
        bottom: true
    }
    color: Theme.transparency(Colors.md3.primary, 0.1)
    IpcHandler {
        target: "lock"
        function lock(enabled) {
            root.visible = enabled;
        }
    }
}
