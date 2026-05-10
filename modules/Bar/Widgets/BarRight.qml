import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "../../../Core"

Item {
    anchors.right: parent.right
    width: 33 * scaleFactor
    height: root.implicitHeight
    property real scaleFactor: 1.0
    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        width: 370
        height: 50
        bottomLeftRadius: Theme.componentRadius / 1.5
        color: Theme.background
    }
}
