import QtQuick
import Quickshell

Text {
    color: Colors.fg
    font.pixelSize: Colors.fontSize
    font.family: Colors.font
    font.weight: Font.DemiBold

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateTime()
    }

    Component.onCompleted: updateTime()

    function updateTime() {
        text = Qt.formatDateTime(new Date(), "ddd, d MMM  hh:mm AP")
    }
}
