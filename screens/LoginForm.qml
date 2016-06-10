import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0
import QtGraphicalEffects 1.0
import "../components"
import "../model"
import "../model/ApiModel.js" as ApiModel

RPage{
    id: root;

    TabBar {
        id: tabBar;
        currentIndex: swipeView.currentIndex;
        anchors.top: root.top;
        anchors.left: root.left;
        anchors.right: root.right;
        z: 1;

        TabButton {
            text: qsTr("Login");
            height: tabBar.height;
            background: Rectangle {
                color: swipeView.currentIndex == 0 ? "#009688" : "#00796B";
            }

        }
        TabButton {
            text: qsTr("Register")
            height: tabBar.height;
            background: Rectangle {
                color: swipeView.currentIndex == 1 ? "#009688" : "#00796B";
            }
        }
        TabButton {
            text: qsTr("Reset Password")
            height: tabBar.height;
            background: Rectangle {
                color: swipeView.currentIndex == 2 ? "#009688" : "#00796B";
            }
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex;

        Item{
            id: loginForm;

            Column{
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: parent.top;
                anchors.topMargin: 40  * settings.pixelDensity;


                TextField{
                    id: loginField;
                    placeholderText: qsTr("Login");

                    font.pixelSize: 14 * settings.pixelDensity;


                    background: Rectangle {
                        implicitWidth: 100 * settings.pixelDensity;
                        implicitHeight: 20 * settings.pixelDensity;
                    }
                }

                Rectangle{
                    height: 5 * settings.pixelDensity;
                    anchors.left: parent.left;
                    anchors.right: parent.right;
                    color: "transparent";
                }

                TextField{
                    id: passwordField;
                    placeholderText: qsTr("Password");

                    echoMode: TextField.Password;

                    font.pixelSize: 14 * settings.pixelDensity;

                    background: Rectangle {
                        implicitWidth: 100 * settings.pixelDensity;
                        implicitHeight: 20 * settings.pixelDensity;
                    }
                }

            }



            RButton{
                id: butSubmit;

                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 40 * settings.pixelDensity;

                width: 60 * settings.pixelDensity;
                height: 20 * settings.pixelDensity;

                onClicked: {
                    if((loginField.text != "" && passwordField.text != "")
                            && ApiModel.login(loginField.text, passwordField.text))
                        stackView.push(Qt.resolvedUrl("MainMenu.qml"));
                    else
                        mb.show("Login or password is incorrect. Please check the correctness of the data you entered and try again.");
//                        mb.show("Логин или пароль неверные. Пожалуйста проверьте правильность введенных вами данных и попробуйте снова.");


                }

                text: qsTr("Sing In");

            }

            Label{
                text: qsTr("Without registering");

                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 10 * settings.pixelDensity;

                font.pixelSize: 5 * settings.pixelDensity;
                font.underline: true;

                MouseArea{
                    anchors.fill: parent;
//                    onClicked: console.log(tabBar.height);
                }
            }

            RMessageBox{
                id: mb;

                anchors.right: parent.right;

                y: tabBar.height + 5 * settings.pixelDensity;

                color: "#F44336";

//                anchors.left: loginForm.right;

                height: 20 * settings.pixelDensity;
                width: 0;
                onWidthChanged: {
                    if(mb.width == 100 * settings.pixelDensity)
                        mb.textOpacity = 1;
                    else
                        mb.textOpacity = 0;
                }

                opacity: 0;

                RTimer{
                    id: timer;

                    end: 5;

                    onComplete: mb.hide();
                }



                function show(message){
                    mb.width = 100 * settings.pixelDensity;
                    mb.opacity = 1;
                    mb.message = message;

                    timer.start();
                }

                function hide(){
                    mb.width = 0;
                    mb.opacity = 0;
                }

                Behavior on width{
                    NumberAnimation {
                        duration: 1000;
                    }
                }

                Behavior on opacity{
                    NumberAnimation {
                        duration: 500;
                    }
                }
            }

        }

        Item{
            id: registerForm;

            Column{

                anchors.top: parent.top;
                anchors.topMargin: 20 * settings.pixelDensity;
                anchors.left:  parent.left;
                anchors.leftMargin: 10 * settings.pixelDensity;
//                anchors.horizontalCenter: parent.horizontalCenter;

                spacing: 10 * settings.pixelDensity;

                MaterialTextField{
                    id: nameRegField;

                    placeholderText: qsTr("Name");

                    height: 17 * settings.pixelDensity;
                    width: 75 * settings.pixelDensity;

                    textColor: "white";
                    borderColor: "white";
                    placeholderTextColor: "#E0E0E0";
                }

                MaterialTextField{
                    id: emailRegField;

                    placeholderText: qsTr("Email");

                    height: 17 * settings.pixelDensity;
                    width: 75 * settings.pixelDensity;

                    textColor: "white";
                    borderColor: "white";
                    placeholderTextColor: "#E0E0E0";
                }

                MaterialTextField{
                    id: loginRegField;

                    placeholderText: qsTr("Login");

                    height: 17 * settings.pixelDensity;
                    width: 75 * settings.pixelDensity;

                    textColor: "white";
                    borderColor: "white";
                    placeholderTextColor: "#E0E0E0";
                }

                MaterialTextField{
                    id: passwordRegField;

                    placeholderText: qsTr("Password");

                    height: 17 * settings.pixelDensity;
                    width: 75 * settings.pixelDensity;

                    textColor: "white";
                    borderColor: "white";
                    placeholderTextColor: "#E0E0E0";
                }
            }

            RButton{
                id: butRegSubmit;

                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 30 * settings.pixelDensity;

                width: 70 * settings.pixelDensity;
                height: 20 * settings.pixelDensity;

                onClicked: {

                    if(nameRegField.text == "" || nameRegField.text.length < 3)
                        nameRegField.borderColor = "#F44336";

                    if(emailRegField.text == "" || !(/^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$/i).test(emailRegField.text))
                        emailRegField.borderColor = "#F44336";

                    if(loginRegField.text == "" || loginRegField.text.length < 3)
                        loginRegField.borderColor = "#F44336";

                    if(passwordRegField.text == "" || passwordRegField.text.length < 8)
                        passwordRegField.borderColor = "#F44336";



//                    if((loginField.text != "" && passwordField.text != "")
//                            && ApiModel.login(loginField.text, passwordField.text))
//                        stackView.push(Qt.resolvedUrl("MainMenu.qml"));
//                    else
//                        mb.show("Login or password is incorrect. Please check the correctness of the data you entered and try again.");
//                        mb.show("Логин или пароль неверные. Пожалуйста проверьте правильность введенных вами данных и попробуйте снова.");


                }

                text: qsTr("Register");

            }
        }

        Item{
            id: resetPasswordForm;
        }
    }

}


