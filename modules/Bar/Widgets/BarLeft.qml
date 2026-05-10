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
        anchors.left: parent.left
        anchors.top: parent.top
        width: 370
        height: 50
        bottomRightRadius: Theme.componentRadius / 1.5
        color: Theme.background
        Rectangle {
            width: parent.width - parent.width / 15
            height: parent.height - parent.height / 4
            color: Theme.subComponents
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 6
            anchors.leftMargin: 17
            radius: Theme.componentRadiusSmall
            clip: true
            RowLayout {
                anchors.fill: parent
                Repeater {
                    model: 5

                    Rectangle {
                        id: myself
                        Layout.alignment: Layout.Center
                        width: 20
                        height: 20
                        radius: 10
                        scale: isActive ? 1.1 : (hovered ? 1.1 : 0.9)
                        property bool hovered
                        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                        color: isActive ? Theme.tertiary : (ws ? Theme.primary : Theme.surfaceVariant)

                        Behavior on color {
                            ColorAnimation {
                                duration: 200
                                easing.type: Easing.InOutCubic
                            }
                        }

                        Behavior on scale {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.OutBack
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: Hyprland.dispatch("workspace " + (index + 1))
                            hoverEnabled: true
                            onEntered: {
                                myself.hovered = true;
                            }
                            onExited: {
                                myself.hovered = false;
                            }
                        }
                    }
                }
            }
        }
    }
}
