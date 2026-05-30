import Quickshell
import Quickshell.Wayland
import QtQuick
import "Widgets"
import "../../Core"

PanelWindow {
    id: root
    anchors {
        top: true
        right: true
        left: true
    }
    implicitHeight: 60
    color: "transparent"
    property real scaleFactor: root.width / 100
    property color background: "#0f0d12"
    property int componentRadius: 20
    WlrLayershell.layer: WlrLayer.Top
    
    Rectangle{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        width: 1900
        height: 45
        radius: Theme.componentRadius
        color: Colors.md3.background
        Clock{
            anchors.centerIn: parent
        }
    }
}
