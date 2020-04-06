import QtQuick 2.12
import QtQuick.Controls 2.12

import space.developers 1.0

Column {
    id: column
    width: parent.width
    height: parent.height
    spacing: 10

    property int nextWord: 0
    property int countButton: 0

    OutputField {
        width: parent.width
        height: parent.height / 4
        textTitle: "Слово"
        onClickedField: {
            textOutput = myData.engWord(nextWord);
            nextWord = myData.lineCount;
            countButton = nextWord;
            nextWord++;
            translate.textOutput = "Показать слово"
        }
    }

    OutputField {
        id: translate
        width: parent.width
        height: parent.height / 4
        textTitle: "Перевод"
        onClickedField: {
            textOutput = myData.rusWord(countButton);
        }
    }

    Rectangle {
        border {
            color: "black"
            width: 4
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "green" }
            GradientStop { position: 1.0; color: "black" }
        }
        width: parent.width
        height: 50
    }

    RepeatWindowButtons {
        id: buttons
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
