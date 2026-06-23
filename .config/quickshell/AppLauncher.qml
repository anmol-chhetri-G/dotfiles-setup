import QtQuick
import Quickshell

Item {
    id: root

    height: parent.height
    width: 40

    Text {
        anchors.centerIn: parent
        text: "󰣇"
        color: Colors.blue
        font.pixelSize: 20
        font.family: Colors.font
        font.weight: Font.Bold
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: Process.exec("rofi -show drun")
    }
}
