import QtQuick 2.12
import QtQuick.Controls 1.4

import space.developers 1.0

Rectangle {
    id: root
    color: "transparent"

    TableView {
        id: table

        anchors.margins: 5
        anchors.fill: parent
        model: dataModel

        TableViewColumn {
            width: parent.width * 0.35
            title: "Дата"
            role: "date"
        }

        TableViewColumn {
            width: parent.width * 0.2
            resizable: false
            title: "Английское слово"
            role: "engWord"
        }

        TableViewColumn {
            width: parent.width * 0.4
            resizable: false
            title: "Русское слово"
            role: "rusWord"
        }
    }
}
