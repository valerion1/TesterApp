import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{

    height: 150 * settings.pixelDensity;
    width: 150 * settings.pixelDensity;

    property color color: background.color;

    Rectangle{
        id: background;
        anchors.fill: parent;
        color: parent.color;
    }
}
