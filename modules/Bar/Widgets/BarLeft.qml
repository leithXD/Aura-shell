import QtQuick
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
    }
}
