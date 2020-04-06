import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQml 2.13

Column {
    id: mainColumn
    width: parent.width
    height: parent.height
    spacing: 5

//    property real buttonsWidth: 380
//    property real buttonsHeight: 70
    property real fontWidth: 30

    Rectangle {
        id: repeaterRect
        width: parent.width
        height: (parent.height - mainColumn.spacing) * 2 / 5
        color: "coral"
        border.color: "coral"
        border.width: 5
        anchors.horizontalCenter: parent.horizontalCenter

        Item {
            width: parent.width - repeaterRect.border.width * 2
            height: parent.height - repeaterRect.border.width * 2
            anchors.centerIn: parent

            Column {
                id: repeaterColumn
                width: parent.width
                height: parent.height
                spacing: repeaterRect.border.width
                anchors.centerIn: parent

                Rectangle {
                    height: parent.height / 3 - repeaterColumn.spacing / 2
                    width: parent.width
                    color: "transparent"

                    Label {
                        anchors.fill: parent
                        color: "black"
                        font {
                            pixelSize: fontWidth
                        }
                        text: "Повторение слов"
                        clip: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                RegularButton {
                    id: engRusButton
                    width: parent.width
                    height: parent.height * 2 / 3 - repeaterColumn.spacing / 2
                    buttonColor: "lightblue"
                    textButton: "Английское - русское"
                    fontPixelSize: fontWidth

                    onClicked: {
                        mainWindow.close()
                        repeatWindow.show()
                    }
                }
            }
        }
    }

    Rectangle {
        id: correctorRect
        width: parent.width
        height: (parent.height - mainColumn.spacing) * 2 / 5
        color: "coral"
        border.color: "coral"
        border.width: 5
        anchors.horizontalCenter: parent.horizontalCenter

        Item {
            width: parent.width - correctorRect.border.width * 2
            height: parent.height - correctorRect.border.width * 2
            anchors.centerIn: parent

            Column {
                id: correctorColumn
                width: parent.width
                height: parent.height
                spacing: correctorRect.border.width
                anchors.centerIn: parent

                Rectangle {
                    height: parent.height / 3 - correctorColumn.spacing * 2 / 3
                    width: parent.width
                    color: "transparent"

                    Label {
                        anchors.fill: parent
                        color: "black"
                        font {
                            pixelSize: fontWidth
                        }
                        text: "Редактирование"
                        clip: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                RegularButton {
                    id: addWordsButton
                    width: parent.width
                    height: parent.height / 3 - correctorColumn.spacing * 2 / 3
                    buttonColor: "lightblue"
                    textButton: "Добавить слова"
                    fontPixelSize: fontWidth

                    onClicked: {
                        mainWindow.close()
                        addWindow.visible = true
                        addWindow.show()
                    }
                }

                RegularButton {
                    id: openListWordsButton
                    width: parent.width
                    height: parent.height / 3 - correctorColumn.spacing * 2 / 3
                    buttonColor: "lightgreen"
                    textButton: "Открыть список слов"
                    fontPixelSize: fontWidth

                    onClicked: {
                        mainWindow.close()
                        fileOpenWindow.visible = true
                        fileOpenWindow.show()
                    }
                }
            }
        }
    }

    RegularButton {
        id: exitButton
        width: parent.width
        height: (parent.height - mainColumn.spacing) * 1 / 5
        buttonColor: "coral"
        textButton: "Выход"
        fontPixelSize: fontWidth

        onClicked: {
            mainWindow.close()
        }
    }

//    function fontPixelWidth() {
//        var temp = Math.max(engRusButton.textButton.length,
//                            rusEngButton.textButton.length,
//                            addWordsButton.textButton.length,
//                            openListWordsButton.textButton.length);
//        console.log("temp = " + temp);
//        console.log("buttonWidth = " + buttonsWidth);
//        console.log("buttonHeight = " + (buttonsHeight));
//        if ((repeaterColumn.width === buttonsWidth && repeaterColumn.height !== buttonsHeight) ||
//                (repeaterColumn.height === buttonsHeight && repeaterColumn.width !== buttonsWidth)) {
//            buttonsWidth = repeaterColumn.width;
//            buttonsHeight = repeaterColumn.height;
//            fontWidth = 30;
//            console.log("fontWidth = " + fontWidth);
//            return;
//        } else {
//            var fontWidth1 = buttonsWidth * 0.003 * buttonsHeight * 0.003 * temp * 1.8;
//            buttonsWidth = repeaterColumn.width;
//            buttonsHeight = repeaterColumn.height;
//            console.log("fontWidth = " + fontWidth);
//            fontWidth = fontWidth1;
//            return;
//        }
//    }
}
