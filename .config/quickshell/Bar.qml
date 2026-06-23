import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

PanelWindow {
    id: barWindow

    anchors { top: true; left: true; right: true }
    height: Colors.barHeight
    color: Colors.surface
    exclusiveZone: Colors.barHeight

    Rectangle {
        anchors.fill: parent
        color: Colors.surface

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 6
            anchors.rightMargin: 6
            spacing: 0

            Item {
                Layout.preferredHeight: parent.height
                Layout.preferredWidth: childrenRect.width
                Layout.alignment: Qt.AlignVCenter

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 2
                    AppLauncher { anchors.verticalCenter: parent.verticalCenter }
                    Workspaces { anchors.verticalCenter: parent.verticalCenter }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height
                ClockWidget { anchors.centerIn: parent }
            }

            Item {
                Layout.preferredHeight: parent.height
                Layout.preferredWidth: childrenRect.width
                Layout.alignment: Qt.AlignVCenter

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4
                    SystemTrayWidget { anchors.verticalCenter: parent.verticalCenter }
                    PowerWidget { anchors.verticalCenter: parent.verticalCenter }
                }
            }
        }
    }
}
