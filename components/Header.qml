import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Item{
    anchors.top: parent.top;
    anchors.left: parent.left;
    anchors.right: parent.right;
    height: 20 * settings.pixelDensity;

    property color color: background.color;

    Rectangle{
        id: background;
        anchors.fill: parent;
        color: parent.color;
    }

    DropShadow {
        anchors.fill: background;
        horizontalOffset: 0;
        verticalOffset: 1 * settings.pixelDensity;
        radius: 15.0;
        samples: 28;
        color: "#80000000";
        source: background;
    }
}
