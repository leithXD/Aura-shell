import Quickshell
import QtQuick
import qs.Core

Item {
    SystemClock {
        id: clock
        precision: SystemClock.date
    }

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "ddd, dd. MMM")
        color: Colors.md3.on_surface
        font.pixelSize: 14
        font.family: "Nunito"
    }
}
