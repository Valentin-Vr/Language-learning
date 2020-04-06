import QtQuick 2.0

Column {
    id: mainColumn
    anchors.fill: parent
    spacing: 5

    InputInTheMainWindow {
        id: inputInTheMainWindow
        height: parent.height * 2 / 4
    }

    ListModel {
        id: listModel

        ListElement {
            textButton: "Добавить слово"
            color: "lightblue"
        }

        ListElement {
            textButton: "Очистить поля ввода"
            color: "pink"
        }

        ListElement {
            textButton: "Главное окно"
            color: "lightgreen"
        }
    }

    Column {
        id: buttonsColumn
        width: parent.width
        height: parent.height - inputInTheMainWindow.height - mainColumn.spacing
        spacing: 5

        Repeater {
            model: listModel
            delegate: RegularButton {
                id: regularButton
                width: parent.width
                height: parent.height / listModel.count - buttonsColumn.spacing * 2 / listModel.count
                textButton: model.textButton
                fontPixelSize: regularButton.height * 0.5
                buttonColor: model.color
                onClicked: executeButtonEvent(model.index)
            }
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
        case 1: // clear fields
            inputInTheMainWindow.engWordText = ""
            inputInTheMainWindow.rusWordText = ""
            break
        case 2: // show word button
            addWindow.close()
            mainWindow.show()
            break
        }
    }
}
