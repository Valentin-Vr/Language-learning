import QtQuick 2.0
import QtQuick.Window 2.12
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.12

Item {
    width: parent.width
    height: parent.height / 4

    property string textTitle: "Слово"
    property string textOutput: "Показать слово"
    property string colorRect: "white"

    signal clickedField

    Rectangle {

        width: parent.width
        height: parent.height
        color: "transparent"
    }

    Column {
        anchors.fill: parent

        Rectangle {
            id: rect_1
            width: parent.width
            height: parent.height / 4
            color: "darkred"

//            RadialGradient {
//                anchors.fill: parent
//                gradient: Gradient {
//                    GradientStop { position: 0.0; color: rect_1.color }
//                    GradientStop { position: 0.99;
//                        color: mouseArea.pressed ? "black" : rect_1.color }
//                }
//            }

            Label {
                anchors.fill: parent
                color: "black"
                font {
                    pixelSize: 30
                }
                text: textTitle
                clip: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: rect_2
            width: parent.width
            height: parent.height * 3 / 4
            color: "darkred"

            RadialGradient {
                anchors.fill: rect_2
                gradient: Gradient {
                    GradientStop { position: 0.0; color: rect_2.color }
                    GradientStop { position: 0.99;
                        color: mouseArea.pressed ? "black" : rect_2.color }
                }
            }

            Label {
                id: word
                anchors.fill: parent
                color: "black"
                font {
                    pixelSize: 30
                }
                text: textOutput
                clip: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: clickedField()
            }
        }
    }
}
