import Quickshell
import Quickshell.Io
import QtQuick
import qs.Core

Item {
    IpcHandler {
        target: "lock"
        function toggle() {
            ShellState.locked = !ShellState.locked;
        }
    }
}
