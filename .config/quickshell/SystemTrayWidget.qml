import QtQuick
import Quickshell.Services.SystemTray

Item {
    id: root

    height: parent.height
    width: trayRepeater.count > 0 ? trayRepeater.count * 28 : 0

    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        spacing: 2

        Repeater {
            id: trayRepeater
            model: SystemTray.model

            Item {
                required property SystemTrayItem modelData

                width: 26
                height: 26

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 2
                    radius: 4
                    color: "transparent"

                    IconImage {
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                        source: modelData.icon
                        iconName: modelData.iconName
                    }

                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.LeftButton | Qt.RightButton
                        onClicked: function(mouse) {
                            if (mouse.button === Qt.LeftButton) modelData.activate()
                            else if (mouse.button === Qt.RightButton) modelData.contextMenu()
                        }
                    }
                }
            }
        }
    }
}
