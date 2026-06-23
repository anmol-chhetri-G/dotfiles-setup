import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    Variants {
        model: Quickshell.screens
        Bar {
            required property var modelData
            screen: modelData
        }
    }
}
