import QtQuick
import Quickshell
import Quickshell.Hyprland

Item {
    id: root

    property var hypr: Hyprland.instance
    property int visibleWorkspaces: 5

    height: parent.height
    width: row.width + 20

    Row {
        id: row
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        spacing: 4

        Repeater {
            model: visibleWorkspaces

            Rectangle {
                required property int index

                width: 28
                height: 22
                radius: 12
                color: {
                    if (!hypr) return Colors.workspaceBg
                    var wsNum = index + 1
                    var all = hypr.workspaces
                    for (var j = 0; j < all.length; j++) {
                        if (all[j].id === wsNum) {
                            return all[j].focused ? Colors.workspaceActive : Colors.primary
                        }
                    }
                    return Colors.workspaceBg
                }

                Text {
                    anchors.centerIn: parent
                    text: parent.index + 1
                    color: {
                        if (!hypr) return Colors.workspaceFg
                        var wsNum = parent.index + 1
                        var all = hypr.workspaces
                        for (var j = 0; j < all.length; j++) {
                            if (all[j].id === wsNum) {
                                return all[j].focused ? "#000000" : Colors.workspaceFg
                            }
                        }
                        return Colors.workspaceFg
                    }
                    font.pixelSize: 12
                    font.family: Colors.font
                    font.weight: Font.Bold
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (hypr) hypr.sendCommand("workspace " + (parent.index + 1))
                    }
                }
            }
        }
    }
}
