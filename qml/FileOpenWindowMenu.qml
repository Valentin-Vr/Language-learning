import QtQuick 2.0

Column {
    id: mainColumn
    anchors.fill: parent
    spacing: 5

    OutputInTheMainWindow {
        id: outputInTheMainWindow
        height: parent.height * 3 / 4
    }

    ListModel {
        id: listModel

        ListElement {
            textButton: "Открыть файл"
            color: "blue"
        }

        ListElement {
            textButton: "Главное окно"
            color: "green"
        }
    }

    Column {
        id: buttonsColumn
        width: parent.width
        height: parent.height - outputInTheMainWindow.height - mainColumn.spacing
        spacing: 5

        Repeater {
            model: listModel
            delegate: RegularButton {
                id: regularButton
                width: parent.width
                height: parent.height / listModel.count - buttonsColumn.spacing / listModel.count
                textButton: model.textButton
                fontPixelSize: regularButton.height * 0.5
                buttonColor: model.color
                onClicked: executeButtonEvent(model.index)
            }
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
        case 0: // open file
            outputInTheMainWindow.contentText = myData.openFile()
            break
        case 1: // show word button
            fileOpenWindow.close()
            mainWindow.show()
            break
        }
    }
}
