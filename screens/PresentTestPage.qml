import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../components"
import "../model"

RPage{
    id: presentTestPage;

    Rectangle{
        anchors.fill: parent;
        color: "white";
    }

    DropShadow {
        anchors.fill: header;
        horizontalOffset: 0;
        verticalOffset: 1 * settings.pixelDensity;
        radius: 18.0;
        samples: 18;
        color: "lightgray";
        source: header;
    }

    Header{
        id: header;
        color: "#009688";

        Button{
            id: buttonBack;
            anchors.left: parent.left;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;

            height: header.height;
            width: height;

            onClicked:{
                stackView.pop();
            }

            style: ButtonStyle{

                background: Rectangle{
                    color: buttonBack.pressed ? "#00796B" : "#009688";
                    Image {
                        anchors.centerIn: parent;
                        width: sourceSize.width * 0.15 * settings.pixelDensity;
                        height: sourceSize.height * 0.15 * settings.pixelDensity;
                        source: "qrc:/img/img/arrow_back.png"
                        opacity: 0.8;
                    }
                }
            }

        }
    }
}
