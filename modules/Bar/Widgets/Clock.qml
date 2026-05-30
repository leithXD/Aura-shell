import QtQuick
import QtQuick.Shapes
import "../../../Core"

Item {
    id: root
    property string text: Qt.formatTime(new Date(), "hh:mm")
    Text {
        anchors.centerIn: parent
        text: root.text
        color: Colors.md3.on_surface
        font.pixelSize: 32
        font.family: "Nunito"
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
