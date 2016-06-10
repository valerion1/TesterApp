import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0
import QtGraphicalEffects 1.0

Item{
    id: root;

    Rectangle{
        anchors.fill: parent;
        color: "#009688";

        LinearGradient {
            anchors.fill: parent;
            gradient: Gradient {
              GradientStop {
                position: 0.25
                color: "#009688"
              }
              GradientStop {
                position: 1
                color: "#B2DFDB"
              }
            }
        }

    }

}
