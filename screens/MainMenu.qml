import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../components"
import "../model"

RPage{
    id: mainMenu;

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
            id: button;
            //initialItem: settings.logined ? main_menu : login_form;
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
                    color: button.pressed ? "#00796B" : "#009688";
                }
            }

        }
    }

    GridView {
        id: view;

        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.top: header.bottom;

        anchors.margins: 5;
        anchors.topMargin: 15;

        cellHeight: view.width / 3;
        cellWidth: cellHeight;

        clip: true;

        model: MenuModel{}

        delegate: Item{

//            property var view: GridView.view;
//            property var isCurrent: GridView.isCurrentItem;


            height: view.cellHeight;
            width: view.cellWidth;


            Rectangle {
                anchors.margins: 5;
                anchors.fill: parent;
                color: model.color;
            }

            Text {
                anchors.centerIn: parent;
                renderType: Text.NativeRendering;
                color: model.text_color;
                font.pixelSize: 40;
                font.bold: true;
                text: model.text;
            }

            MouseArea {
                anchors.fill: parent;
                onClicked: view.currentIndex = model.index;
            }
        }
    }

}
