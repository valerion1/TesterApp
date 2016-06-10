import QtQuick 2.5

Timer{
    signal complete;

    property int tick: 0;
    property int end: 0;

    interval: 1000;
    repeat: true;

    onTickChanged:{
        if(tick >= end){
            complete();
            stop();
            tick = 0;
        }
    }


    onTriggered: {
        ++tick;
        console.log(tick);
    }
}
