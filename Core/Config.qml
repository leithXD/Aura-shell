pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    property alias visibility: jsonAdapter.visibility
    property alias transparency: jsonAdapter.transparency

    FileView {
        path: Quickshell.env("HOME") + "/.config/Aura/shell.json"
        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: jsonAdapter

            readonly property Visibility visibility: Visibility {}
            readonly property Transparency transparency: Transparency {}
            // Du kannst dir hier mehr rein machen einfach dann auch die komponenten auch erstsellen
        }
    }

    component Visibility: JsonObject {
        property bool weather: true
        property bool workspaces: true
        property bool time: true
        property bool date: true
        property bool logo: true
    }

    component Transparency: JsonObject {
        property real surface: 1
        property real surfaceLayer: 1
    }
}
