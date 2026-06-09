pragma Singleton
import Quickshell
import QtQuick

Singleton {
    property string wallpaper: "/home/leithrice/.local/state/nova/current"
    // property string state: `${Quickshell.env("XDG_STATE_HOME") || `${home}/.local/state`}/nova/current`    
    property int componentRadius: 20
    property int componentRadiusSmall: componentRadius / 2
    function transparency(hexColor, alpha) {
        const c = Qt.color(hexColor)
        return Qt.rgba(c.r, c.g, c.b, alpha)
    }
}
