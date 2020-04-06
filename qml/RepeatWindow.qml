import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: repeatWindow
    signal signalExit
    width: 420
    height: 480
    title: qsTr("Project 1.1")
    minimumWidth: 420
    minimumHeight: 480

    RepeatWindowMenu {

    }
}

