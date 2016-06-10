import QtQuick 2.5

Rectangle{
    id: messageBox;

    property string message;
    property color textColor: "white";
    property real textOpacity: 0;

    Text{
        id: msg;

//        contentHeight: messageBox.height;
//        contentWidth: messageBox.width;

        opacity: messageBox.textOpacity;

        anchors.fill: parent;
        anchors.verticalCenter: parent.verticalCenter;

        anchors.margins: 1 * settings.pixelDensity;

        wrapMode: Text.Wrap;

        text: message;

        font.pixelSize: 5 * settings.pixelDensity;

        color: textColor;

        Behavior on opacity{
            NumberAnimation{
                duration: msg.opacity == 1 ? 100 : 1000;
            }
        }
    }
}
