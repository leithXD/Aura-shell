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
        color: Theme.transparency(Colors.md3.surface_container, 0.5)

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            width: 23
            height: 23
            color: Colors.md3.primary
            radius: Theme.componentRadiusSmall
            property int displayIndex: ((Hyprland.focusedWorkspace?.id ?? 1) - 1) % 5
            property int displacement: 13 + displayIndex * 30
            x: displacement
            Behavior on x {
                NumberAnimation {
                    duration: 100
                    easing: Easing.InCurve
                }
            }
        } // 13,43, 73, 103, 133

        RowLayout {
            id: row
            anchors.centerIn: parent
            spacing: 15
            Layout.alignment: Qt.AlignVCenter

            Repeater {
                model: 5

                Rectangle {
                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                    property bool isOccupied: ws !== undefined

                    // isOccupied works only in the first 5 rn

                    width: 15
                    height: 15
                    radius: 16
                    color: isActive ? Colors.md3.primary : isOccupied ? Colors.md3.surface_container_highest : Colors.md3.surface_container_low
                    Behavior on color {
                        ColorAnimation {
                            duration: 100
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspace " + (index + 1))
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onWheel: function (wheel) {
                if (wheel.angleDelta.y > 0) {
                    Quickshell.execDetached(["switchWs", "+"]);
                } else {
                    Quickshell.execDetached(["switchWs", "-"]);
                }
            }
        }
    }
}
