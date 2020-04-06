import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    id: openFileRect

    property int titleRectHeight: 40
    property string titleText: "Содержимое файла"
    property string contentText

    width: parent.width

    Column {
        width: parent.width
        height: parent.height

        Rectangle {
            id: titleRect
            width: parent.width
            height: titleRectHeight
            color: "green"
            opacity: 0.8
        }

        Rectangle {
            id: contentRect
            width: parent.width
            height: parent.height - titleRectHeight
            color: "green"
            opacity: 0.5
        }
    }

    Column {
        width: parent.width
        height: parent.height

        Label {
            id: title
            height: titleRectHeight
            color: "black"
            font.pixelSize: titleRectHeight / 1.5
            text: titleText
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: labelRect
            width: parent.width
            height: parent.height - titleRectHeight
            color: "transparent"

//            Label {
//                id: labelFile
//                width: parent.width
//                height: parent.height
//                color: "black"
//                text: contentText
//                font.pixelSize: 15
//                y: -vbar.position * this.height
//                clip: true
////                focus: true
//            }

            DataTable {
                width: parent.width
                height: parent.height
            }

//            ScrollBar {
//                id: vbar
//                hoverEnabled: true
//                active: hovered || pressed
//                orientation: Qt.Vertical
//                size: 0.8
//                anchors.top: parent.top
//                anchors.right: parent.right
//                anchors.bottom: parent.bottom
//            }
        }




    }
}
