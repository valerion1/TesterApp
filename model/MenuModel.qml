import QtQuick 2.0
import "../components"

ListModel {
    id: dataModel

    ListElement {
        color: "#19C4E1"
        text_color: "white"
        text_size: 20;
        text: "C++"
    }
    ListElement {
        color: "#6082bb"
        text_color: "white"
        text_size: 20;
        text: "PHP"
    }
    ListElement {
        color: "#f0db4f"
        text_color: "323330"
        text_size: 25;
        text: "JS"
    }
    ListElement {
        color: "#ec662b"
        text_color: "white"
        text_size: 15;
        text: "HTML"
    }
}
