import QtQuick
import "../../../Core"

Item {
    anchors.right: parent.right
    width: 33 * scaleFactor
    height: root.implicitHeight
    property real scaleFactor: 1.0
    Rectangle {
        anchors.topMargin: 10
        anchors.rightMargin: 10
        anchors.right: parent.right
        anchors.top: parent.top
        width: 370
        height: 50
        radius: Theme.componentRadius
        color: Theme.background
    }
}
