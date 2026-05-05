import QtQuick
import "../../../Core"

Item {
    id: root
    anchors.horizontalCenter: parent.horizontalCenter
    width: 33 * scaleFactor
    height: root.implicitHeight
    property real scaleFactor: 1.0
    property string text: Qt.formatTime(new Date(), "hh:mm")

    Rectangle {
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        width: 500
        height: 50
        radius: Theme.componentRadius
        color: Theme.background
        Rectangle {
            anchors.centerIn: parent
            color: Theme.subComponents
            width: parent.width / 4
            height: parent.height - parent.height / 4
            radius: Theme.componentRadiusSmall
            Text {
                anchors.centerIn: parent
                text: root.text
                color: Theme.text
                font.pixelSize: 28
                font.family: "Nunito"
            }
        }
    }
    Timer {
        running: true
        repeat: true
        interval: 1000
        onTriggered: {
            root.text = Qt.formatTime(new Date(), "hh:mm");
        }
    }
}
