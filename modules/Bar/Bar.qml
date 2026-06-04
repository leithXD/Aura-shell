import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "Widgets"
import qs.Core

Variants {
    model: Quickshell.screens
    PanelWindow {
        id: root
        anchors {
            top: true
            right: true
            left: true
        }
        implicitHeight: 80 * ShellState.scale
        color: "transparent"
        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.namespace: "Bar"
        property var modelData
        screen: modelData

        Rectangle {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4 * ShellState.scale
            anchors.leftMargin: 10 * ShellState.scale
            width: 350 * ShellState.scale
            height: 60 * ShellState.scale
            radius: Theme.componentRadius * ShellState.scale
            color: Theme.transparency(Colors.md3.background, Config.transparency.surface)

            Item {
                id: leftGroup
                height: parent.height
                width: 500 * ShellState.scale

                Item {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 7 * ShellState.scale
                    width: 170 * ShellState.scale
                    height: 50 * ShellState.scale
                    Workspaces {}
                }

                RowLayout {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 80 * ShellState.scale
                    Layout.alignment: Qt.AlignHCenter
                    Item {
                        width: 150 * ShellState.scale
                        height: 60 * ShellState.scale
                    }
                    Date {
                        fontSize: 14 * ShellState.scale
                    }
                    Clock {
                        fontSize: 14 * ShellState.scale
                    }
                }
            }
        }

        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4 * ShellState.scale
            anchors.rightMargin: 10 * ShellState.scale
            width: 350 * ShellState.scale
            height: 60 * ShellState.scale
            radius: Theme.componentRadius * ShellState.scale
            color: Theme.transparency(Colors.md3.background, Config.transparency.surface)
            Item {
                id: rightGroup
                anchors.right: parent.right
                height: parent.height
                width: 500 * ShellState.scale
                RowLayout {
                    anchors.fill: parent
                    spacing: 0
                    Item {
                        // spacer
                        width: 150 * ShellState.scale
                    }
                    Weather {
                        Layout.preferredWidth: 85 * ShellState.scale
                        Layout.preferredHeight: 45 * ShellState.scale
                        visible: Config.visibility.weather
                    }

                    WidgetButton {
                        Layout.preferredWidth: 85 * ShellState.scale
                        Layout.preferredHeight: 45 * ShellState.scale
                        command: "top -bn1 | grep 'Cpu(s)' | awk '{printf \"%d%%\\n\", 100 - $8}'"
                        iconName: "\ue322"
                    }

                    WidgetButton {
                        Layout.preferredWidth: 85 * ShellState.scale
                        Layout.preferredHeight: 45 * ShellState.scale
                        command: "free | awk '/Mem:/ {printf \"%d%%\\n\", $3/$2 * 100}'"
                        iconName: "\uf7a3"
                    }

                    Logo {
                        Layout.preferredWidth: 30 * ShellState.scale
                        Layout.preferredHeight: 30 * ShellState.scale
                    }
                    Item {
                        // spacer
                        width: 15 * ShellState.scale
                    }
                }
            }
        }
    }
}
