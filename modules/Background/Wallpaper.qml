import QtQuick
import Quickshell
import qs.Core

Item {
    id: root

    property var modelData
    property string screenName: modelData?.name ?? ""
    property string source: ShellState.wallpaper

    anchors.fill: parent

    Item {
        anchors.fill: parent

        Image {
            id: wallpaperImg
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            smooth: true
            source: root.source
        }
    }
}
