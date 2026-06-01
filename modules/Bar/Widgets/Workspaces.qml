import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Core

Item {
    anchors.fill: parent
    Rectangle {
        width: parent.width
        height: parent.height
        radius: Theme.componentRadius / 1.4
        color: Theme.transparency(Colors.md3.surface_container, 0.6)

        RowLayout {
            id: row
            anchors.centerIn: parent
            spacing: 10
            Layout.alignment: Qt.AlignVCenter

            Repeater {
                model: 5

                Rectangle {
                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                    property bool isOccupied: ws !== undefined

                    width: 23
                    height: 23
                    radius: 16
                    color: isActive ? Colors.md3.primary : isOccupied ? Colors.md3.surface_container_high : Colors.md3.on_secondary

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspace " + (index + 1))
                    }
                }
            }
        }
    }
}
