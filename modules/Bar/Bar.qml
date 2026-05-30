import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "Widgets"
import "../../Core"

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

    Rectangle{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        width: 1900
        height: 60
        radius: Theme.componentRadius
        color: Theme.transparency(Colors.md3.background, 0.8)

        Item{
            id: leftGroup
            height: parent.height
            width: 500
            RowLayout {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 80
                Layout.alignment: Qt.AlignHCenter
                Item{width: 150}
                Date {}
                Clock{}
            }
        }
        Item{
            id: middleGroup
            anchors.centerIn: parent
            height: parent.height
            width: 700
        }
        Item{
            id: rightGroup
            anchors.right: parent.right
            height: parent.height
            width: 500
            Logo{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 15
                width: 30
                height: 30
            }
            Weather{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 350
                width: 85
                height: 38
            }
        }
    }
}
