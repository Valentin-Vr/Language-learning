import QtQuick 2.0

Row {
    id: rowButtonWindow
    spacing: 10
    width: parent.width

    ListModel {
        id: listModel

        ListElement {
            textButton: "Главное окно"
            color: "green"
        }

        ListElement {
            textButton: "Убрать из словаря"
            color: "blue"
        }
    }

    Repeater {
        model: listModel
        delegate: RegularButton {
            width: parent.width / 2
            height: parent.height
            textButton: model.textButton
            fontPixelSize: parent.height / 2.5
            buttonColor: model.color
            onClicked: executeButtonEvent(model.index)
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
        case 0: // exit button
            repeatWindow.signalExit()
            break
        case 1: // next word button
            console.log(nextWord);
            engWord.outFieldText = myData.engWord(nextWord);
            nextWord = myData.lineCount;
            countButton = nextWord;
            nextWord++;
            break
        }
    }
}
