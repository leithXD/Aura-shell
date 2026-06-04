import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.Core

Item {
    id: root
    property int fontSize: 14
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: Colors.md3.on_surface
        font.pixelSize: fontSize
        font.family: "Nunito"
    }
}
