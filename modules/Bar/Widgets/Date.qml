import Quickshell
import QtQuick
import qs.Core

Item {
    property int fontSize: 14
    SystemClock {
        id: clock
        precision: SystemClock.date
    }

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "ddd, dd. MMM")
        color: Colors.md3.on_surface
        font.pixelSize: fontSize
        font.family: "Nunito"
    }
}
