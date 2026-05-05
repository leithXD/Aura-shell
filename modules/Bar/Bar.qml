import Quickshell
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
    BarLeft {
        scaleFactor: root.scaleFactor
    }
    BarRight {
        scaleFactor: root.scaleFactor
    }
    BarMiddle {
        scaleFactor: root.scaleFactor
    }
}
