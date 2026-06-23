import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root

    height: parent.height
    width: 40

    Rectangle {
        anchors.centerIn: parent
        width: 32
        height: 28
        radius: 8
        color: mouseArea.containsMouse ? Colors.pink : "transparent"

        Text {
            anchors.centerIn: parent
            text: ""
            color: mouseArea.containsMouse ? "#d90f0f" : Colors.pink
            font.pixelSize: 18
            font.family: Colors.font
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: Process.exec("rofi -show power-menu -modi power-menu:~/.config/rofi/power.rasi")
        }
    }
}
