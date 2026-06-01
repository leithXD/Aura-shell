import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Effects
import qs.Core

Item {
    property int weatherIcon

    Text {
        id: icon
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 10
        text: {
            if (weatherIcon === 0)
                return "\ue81a";      // sunny
            if (weatherIcon <= 3)
                return "\ue2bd";       // cloudy
            if (weatherIcon === 45 || weatherIcon === 48)
                return "\ue818"; // fog
            if (weatherIcon >= 51 && weatherIcon <= 82)
                return "\uf176";    // rain
            if (weatherIcon >= 71 && weatherIcon <= 77)
                return "\ued5b";    // snow
            if (weatherIcon >= 95)
                return "\uebdb";      // storm
            return "\ue000";
        }
        font.family: "Material Symbols Rounded"
        font.pointSize: 16
        color: Colors.md3.on_surface
    }

    Text {
        id: degrees
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 10
        text: ""
        font.family: "Cascadia Nove NF"
        font.pointSize: 12
        color: Colors.md3.on_surface
    }
    Process {
        id: weatherProcess
        running: true
        command: ["curl", "https://api.open-meteo.com/v1/forecast?latitude=51.2562&longitude=7.1508&current=temperature_2m,weather_code&forecast_days=1"]
        stdout: StdioCollector {
            onStreamFinished: {
                console.log(State.onBattery);
                const json = JSON.parse(this.text);
                degrees.text = Math.round(json.current.temperature_2m) + " °C";
                weatherIcon.value = mapWeather(json.current.weather_code);
            }
        }
    }

    function mapWeather(code) {
        if (code === 0)
            return 5;                  // sunny
        if (code <= 3)
            return 4;                   // cloudy
        if (code === 45 || code === 48)
            return 3;  // fog
        if (code >= 51 && code <= 82)
            return 2;    // rain
        if (code >= 71 && code <= 77)
            return 1;    // snow
        if (code >= 95)
            return 2;                  // storm
        return 3;
    }

    Timer {
        interval: 900000
        running: true
        repeat: true
        onTriggered: {
            weatherProcess.running = true;
        }
    }

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: Colors.md3.on_surface
        opacity: 0
        Behavior on opacity {
            NumberAnimation {
                duration: 100
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.opacity = 0.1;
            }
            onExited: {
                parent.opacity = 0;
            }
        }
    }
}
