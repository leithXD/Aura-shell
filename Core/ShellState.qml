pragma Singleton
import Quickshell
import QtQuick

Singleton {
    property bool locked: false
    property string wallpaper: Config.internal.wallpaper
    property bool dashOpened: true
}
