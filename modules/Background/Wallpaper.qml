import QtQuick
import Quickshell
import Quickshell.Io
import qs.Core

Item {
    id: root

    property var modelData
    property string screenName: modelData?.name ?? ""
    property string source: Theme.wallpaper
    property bool firstTurn: true

    anchors.fill: parent

    Connections {
        target: ShellState
        function onWallpaperUpdateChanged() {
            if (root.firstTurn) {
                wallpaperImg1.source = "";
                wallpaperImg1.source = Theme.wallpaper;
                root.firstTurn = !root.firstTurn;
            } else {
                wallpaperImg2.source = "";
                wallpaperImg2.source = Theme.wallpaper;
                root.firstTurn = !root.firstTurn;
            }
            console.log("Update");
        }
    }

    Item {
        anchors.fill: parent

        Image {
            id: wallpaperImg1
            cache: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            smooth: true
            source: root.source
            opacity: root.firstTurn ? 0 : 1
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }
        Image {
            id: wallpaperImg2
            cache: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            smooth: true
            source: root.source
            opacity: root.firstTurn ? 1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }
    }
}
