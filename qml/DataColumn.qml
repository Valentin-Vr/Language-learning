import QtQuick 2.0

Item {
    id: dataColumn

    property int textHeight: textName.font.pixelSize + 0.9 * textName.font.pixelSize
    property string textColumn

    signal doubClicked()
    signal rightClicked()

    width: parent.width
    height: textHeight

//    Text {
//        id: textName
//        //                anchors {
//        //                    left: parent.left
//        //                    leftMargin: 12
//        //                    verticalCenter: parent.verticalCenter
//        //                }
//        font.pixelSize: 12
//        color: "#000000"
//        text: textColumn
//    }


        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onDoubleClicked: name.doubClicked();
            onClicked: {
                if (mouse.button === Qt.RightButton)
                {
//                    name.rightClicked()
//                    contextMenu.visible = true
//                    contextMenu.x =mouseX
//                    contextMenu.y =mouseY + model.index*parent.height + colorRecta.y
                    console.log("я нажат")
                }
            }
        }
}
