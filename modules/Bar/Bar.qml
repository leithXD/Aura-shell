import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "Widgets"
import qs.Core

PanelWindow {
    id: root
    anchors {
        top: true
        right: true
        left: true
    }
    implicitHeight: 80
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: "Bar"

    Rectangle {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        width: 350
        height: 60
        radius: Theme.componentRadius
        color: Theme.transparency(Colors.md3.background, Config.transparency.surface)

        Item {
            id: leftGroup
            height: parent.height
            width: 500

            Item {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 7
                width: 170
                height: 50
                Workspaces {}
            }

            RowLayout {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 80
                Layout.alignment: Qt.AlignHCenter
                Item {
                    width: 150
                    height: 60
                }
                Date {}
                Clock {}
            }
        }
    }

    Rectangle {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        width: 350
        height: 60
        radius: Theme.componentRadius
        color: Theme.transparency(Colors.md3.background, Config.transparency.surface)
        Item {
            id: rightGroup
            anchors.right: parent.right
            height: parent.height
            width: 500
            RowLayout {
                anchors.fill: parent
                spacing: 0
                Item {
                    // spacer
                    width: 150
                }
                Weather {
                    Layout.preferredWidth: 85
                    Layout.preferredHeight: 45
                    visible: Config.visibility.weather
                }

                WidgetButton {
                    Layout.preferredWidth: 85
                    Layout.preferredHeight: 45
                    command: "top -bn1 | grep 'Cpu(s)' | awk '{printf \"%d%%\\n\", 100 - $8}'"
                    iconName: "\ue322"
                }

                WidgetButton {
                    Layout.preferredWidth: 85
                    Layout.preferredHeight: 45
                    command: "free | awk '/Mem:/ {printf \"%d%%\\n\", $3/$2 * 100}'"
                    iconName: "\uf7a3"
                }

                Logo {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 30
                }
                Item {
                    // spacer
                    width: 15
                }
            }
        }
    }
}
