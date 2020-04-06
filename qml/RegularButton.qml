import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id: root

    property string textButton
    property int fontPixelSize
    property color buttonColor

    signal clicked()

    Rectangle {
        id: backgroundRect
        width: parent.width
        height: parent.height
        color: buttonColor
    }

    RadialGradient {
        anchors.fill: backgroundRect
        gradient: Gradient {
            GradientStop { position: 0.0; color: backgroundRect.color }
            GradientStop { position: 0.99; color: mouseArea.pressed ? "#blue" : backgroundRect.color}
        }
    }

    Text {
        id: textInButton
        anchors.centerIn: parent
        text: qsTr(textButton)
        color: "black"
        font {
            pixelSize: fontPixelSize
//            bold: true
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            console.log(textInButton.contentWidth)
            root.clicked()
        }
    }
}
