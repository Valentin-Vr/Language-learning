import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

import space.developers 1.0

ApplicationWindow {
    id: additionalWindow
    visible: true
    width: 420
    height: 480
    title: qsTr("Project 1.1")
    minimumWidth: 420
    minimumHeight: 480

    signal outputSignal

    AddWindowMenu {

    }
}
