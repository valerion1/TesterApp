import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../components"

Rectangle{
    id: rect;

    width: initialWidth;

    onWidthChanged: width == height ? rect.starAnimate() : rect.stopAnimate();

    property real initialWidth;
    property string text: "";
    property bool bisy: false;

    Text{
        id: text;
        anchors.centerIn: rect;
//        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Roboto"
        font.pixelSize: 13 * settings.pixelDensity;
        color: "white"
        text: rect.text;

        Behavior on opacity{
            NumberAnimation{
                duration: text.opacity == 1 ? 100 : 250;
            }
        }
    }

    signal clicked();

    MouseArea{
        anchors.fill: parent;

        onClicked: rect.clicked();
    }

    radius: 8;

//    color: "blue";

    state: "NORMAL";

    states: [

        State{
            name: "LOADING";
            PropertyChanges{
                target: rect;
                width: height;
                radius: height * 0.5;

            }
            PropertyChanges{
                target: text;
                opacity: 0;
            }
        },

        State{
            name: "NORMAL";
            PropertyChanges{
                target: rect;
                width: initialWidth;
                radius: 8;

            }
            PropertyChanges{
                target: text;
                opacity: 1;
            }
        }

    ]


    Behavior on width {
        NumberAnimation {
            duration: 500;
            easing.type: Easing.InOutQuad;
        }
    }

    Behavior on radius {
        NumberAnimation {
            duration: 500;
            easing.type: Easing.InOutQuad;
        }
    }

    SmallCircle{
        id: small_1;

        visible: false;

        x: rect.height / 2 - height / 2;
        y: rect.height / 2 - height / 2;

        color: "white";

        diameter: rect.height * 0.1;
        radiusRound: rect.height / 2;
        startPoint: 0;
    }

    SmallCircle{
        id: small_2;

        visible: false;

        x: rect.height / 2 - height / 2;
        y: rect.height / 2 - height / 2;

        color: "white";

        diameter: rect.height * 0.1;
        radiusRound: rect.height / 2;
        startPoint: 60;
    }

    SmallCircle{
        id: small_3;

        visible: false;

        x: rect.height / 2 - height / 2;
        y: rect.height / 2 - height / 2;

        color: "white";

        diameter: rect.height * 0.1;
        radiusRound: rect.height / 2;
        startPoint: 140;
    }

    function starAnimate(){

        small_1.visible = true;
        small_2.visible = true;
        small_3.visible = true;

        small_1.animateRun = true;
        small_2.animateRun = true;
        small_3.animateRun = true;
    }

    function stopAnimate(){

        small_1.visible = false;
        small_2.visible = false;
        small_3.visible = false;
        small_1.animateRun = false;
        small_2.animateRun = false;
        small_3.animateRun = false;
    }
}
