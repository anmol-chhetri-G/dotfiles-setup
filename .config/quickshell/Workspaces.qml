import QtQuick
import Quickshell
import Quickshell.I3

Item {
    id: root

    property var i3: I3.instance
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
                    if (!i3) return Colors.workspaceBg
                    var cur = i3.focusedWorkspace
                    if (cur && cur.num === (index + 1)) return Colors.workspaceActive
                    var all = i3.workspaces
                    for (var j = 0; j < all.length; j++) {
                        if (all[j].num === (index + 1) && all[j].visible) return Colors.primary
                    }
                    return Colors.workspaceBg
                }

                Text {
                    anchors.centerIn: parent
                    text: parent.index + 1
                    color: {
                        if (!i3) return Colors.workspaceFg
                        var cur = i3.focusedWorkspace
                        if (cur && cur.num === (parent.index + 1)) return "#000000"
                        return Colors.workspaceFg
                    }
                    font.pixelSize: 12
                    font.family: Colors.font
                    font.weight: Font.Bold
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: { if (i3) i3.sendCommand("workspace " + (parent.index + 1)) }
                }
            }
        }
    }
}
