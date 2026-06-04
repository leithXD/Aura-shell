pragma Singleton
import Quickshell
import QtQuick

Singleton {
    property bool locked: false
    property string wallpaper: Config.internal.wallpaper
    property bool dashOpened: true
    property real scale: Math.min(Screen.width / 1920, Screen.height / 1080)
}
