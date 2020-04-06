import QtQuick 2.0

Row {
    id: mainWindowButtons
    spacing: 3
    width: parent.width

    ListModel {
        id: listModel

        ListElement {
            textButton: "Добавить"
            color: "green"
        }

        ListElement {
            textButton: "Открыть файл"
            color: "blue"
        }

        ListElement {
            textButton: "Очистить"
            color: "red"
        }

        ListElement {
            textButton: "Главное окно"
            color: "green"
        }
    }

    Repeater {
        model: listModel
        delegate: RegularButton {
            width: parent.width / 4 - mainWindowButtons.spacing * 3 / 4
            height: parent.height
            textButton: model.textButton
            fontPixelSize: parent.height / 2.5
            buttonColor: model.color
            onClicked: executeButtonEvent(model.index)
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
        case 0: // add words
            myData.writeToFile(inputInTheMainWindow.englishWord,
                               inputInTheMainWindow.russianWord);
            inputInTheMainWindow.engWordText = ""
            inputInTheMainWindow.rusWordText = ""
            break
        case 1: // open file
            outputInTheMainWindow.contentText = myData.openFile()
            break
        case 2: // show word button
            inputInTheMainWindow.engWordText = ""
            inputInTheMainWindow.rusWordText = ""
            break
        case 3: // show word button
            addWindow.close()
            mainWindow.show()
            break
        }
    }
}
