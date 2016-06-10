import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button{
    id: button;

    style: ButtonStyle{

        label: Text {
            renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Roboto"
            font.pixelSize: 13 * settings.pixelDensity;
            color: "white"
            text: control.text;

        }

        background: Rectangle{
            color: button.pressed ? Qt.darker("#03A9F4")  : "#03A9F4";
            radius: 5 * settings.pixelDensity;
        }
    }
}
