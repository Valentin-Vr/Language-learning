import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    id: mainWindow
    visible: true
    width: 420
    height: 480
    title: qsTr("Project 1.1")
    minimumWidth: 420
    minimumHeight: 480
    color: "darkred"

    MainMenu {
        anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter
    }

    AddWindow {
        id: addWindow
        title: qsTr("Добавление слов")
        visible: false

        onOutputSignal: {
            addWindow.close()
            mainWindow.show()
        }
    }

    FileOpenWindow {
        id: fileOpenWindow
        title: qsTr("Открытие файла")
        visible: false

        onOutputSignal: {
            fileOpenWindow.close()
            mainWindow.show()
        }
    }

    RepeatWindow {
        id: repeatWindow
        title: qsTr("Повторение")

        onSignalExit: {
            repeatWindow.close()
            mainWindow.show()
        }
    }
}
