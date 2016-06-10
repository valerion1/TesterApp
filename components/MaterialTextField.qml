import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

TextField{
    id: root;
    font.pixelSize: 14 * settings.pixelDensity;

    property color textColor: "black";
    property color borderColor: "black";
    property color placeholderTextColor: "lightgray";

    onEditingFinished:{
        borderColor = "white";
    }


    style: TextFieldStyle {
        textColor: root.textColor;

        placeholderTextColor: root.placeholderTextColor;

        background: Rectangle {
            implicitWidth: root.width;
            implicitHeight: root.height;
            border.width: 0;
            color: "transparent";

            Rectangle{
                height: root.focus ? 0.9 * settings.pixelDensity : 0.3 * settings.pixelDensity;

                color: root.borderColor;

                anchors.bottom: parent.bottom;
                anchors.left: parent.left;
                anchors.right: parent.right;
            }
         }
    }
}
