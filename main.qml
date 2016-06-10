import QtQuick 2.5
import QtQuick.Controls 1.4
import "components"
import "screens"

RApplicationWindow{
    id: appWindow;


    property Item login_form: LoginForm{}
    property Item main_menu: MainMenu{}

    StackView{
        id: stackView;
        anchors.fill: parent;
        initialItem: settings.logined ? main_menu : login_form;

    }
}
