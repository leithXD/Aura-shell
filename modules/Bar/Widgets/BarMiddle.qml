import QtQuick
import QtQuick.Shapes
import "../../../Core"

Item {
    id: root
    anchors.horizontalCenter: parent.horizontalCenter
    width: 33 * scaleFactor
    height: root.implicitHeight
    property real scaleFactor: 1.0
    property string text: Qt.formatTime(new Date(), "hh:mm")

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        width: 300
        height: 50
        radius: Theme.componentRadius
        color: "transparent"
        Shape {
            preferredRendererType: Shape.CurveRenderer
            scale: 1.5
            anchors.horizontalCenter: parent.horizontalCenter
            ShapePath {
                strokeWidth: 2
                fillColor: Theme.background
                strokeColor: Theme.background

                PathSvg {
                    path: "M121.074 0.5L242.074 0.500008C242.074 0.500008 222.074 3.49998 222.074 20.5C222.074 20.5 222.074 39.5 206.574 37.4999H121.074"
                }
            }

            ShapePath {
                strokeWidth: 2
                fillColor: Theme.background
                strokeColor: Theme.background

                PathSvg {
                    path: "M121.074 0.5L0.0743408 0.500008C0.0743408 0.500008 20.0743 3.49998 20.0743 20.5C20.0743 20.5 20.0743 39.5 35.5743 37.4999H121.074"
                }
            }
            Text {
                anchors.centerIn: parent
                text: root.text
                color: Theme.text
                font.pixelSize: 24
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
