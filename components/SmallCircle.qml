import QtQuick 2.0

Rectangle{
    id: qwe;

    property real diameter;
    property real radiusRound;
    property real startPoint: 0;
    property bool animateRun: false;

    height: diameter;
    width: diameter;
    radius: diameter * 0.5;

    Behavior on x{
        NumberAnimation{
            duration: 100;
            easing.type: Easing.InBounce;
        }
    }

    Behavior on y{
        NumberAnimation{
            duration: 100;
            easing.type: Easing.InBounce;
        }
    }

    Timer {
        id: timer;
            interval: 25;
            running: animateRun;
            repeat: true;

            property real angle: startPoint;
            property real rd: radiusRound - qwe.width / 2;

            onTriggered:{
                qwe.x = rd + rd * Math.cos(angle);
                qwe.y = rd + rd * Math.sin(angle);
                if(angle < 360){
                    angle += 0.1;
                }
                else
                    angle = 0;
            }
        }
}
