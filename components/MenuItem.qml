import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    id: root;

    property color color;
    property color textColor;
    property real textPixelSize;
    property string text;

    signal clicked();

    Rectangle {
        anchors.margins: 5;
        anchors.fill: parent;
        color: mouseArea.pressed ? root.color : root.color;
    }

    Text {
        anchors.centerIn: parent;
        color: root.textColor;
        font.pixelSize: root.textPixelSize;
        font.bold: true;
        text: root.text;
    }

    MouseArea {
        id: mouseArea;
        anchors.fill: parent;
        onClicked: root.clicked();
    }
}
