import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "../../../Core"

Item {
    anchors.left: parent.left
    width: 33 * scaleFactor
    height: root.implicitHeight
    property real scaleFactor: 1.0

    Rectangle {
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.left: parent.left
        anchors.top: parent.top
        width: 370
        height: 50
        radius: Theme.componentRadius
        color: Theme.background
        RowLayout {
            anchors.fill: parent
            Repeater {
                model: 5

                Rectangle {
                    id: myself
                    Layout.alignment: Layout.Center
                    width: 30
                    height: 30
                    radius: 15
                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                    color: isActive ? Theme.tertiary : (ws ? Theme.primary : Theme.surfaceVariant)

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspace " + (index + 1))
                    }
                }
            }
        }
    }
}
