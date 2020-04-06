import QtQuick 2.0
import QtQuick.Controls 2.12

Column {
    id: columnRect

    property string englishWord: engWord.editFieldText
    property string russianWord: rusWord.editFieldText
    property alias engWordText: engWord.wordText
    property alias rusWordText: rusWord.wordText

    width: parent.width
    height: parent.height / 2
    spacing: 10

    EditBox {
        id: engWord
        width: parent.width
        height: parent.height / 2 - columnRect.spacing / 2
        rectTitleColor: "red"
        titleText: "Cлово"
    }

    EditBox {
        id: rusWord
        width: parent.width
        height:  parent.height / 2 - columnRect.spacing / 2
        rectTitleColor: "blue"
        titleText: "Перевод"
    }
}
