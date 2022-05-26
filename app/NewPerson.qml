import QtQuick 2.0
import QtQuick.Controls 2.2
Item {
    id:nextwindow
    width: 640
    height: 480
    Rectangle{
        id:errorState2
        visible : false
        color:"red"
        height: parent.height/10
        width: parent.width*0.35
        border.color: "black"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            anchors.centerIn: parent
            font.pointSize: 12
            color: "black"
            text: "Данные введены не полностью"
        }
    }
    Rectangle{
        id:back

        width: parent.width*0.07
        height: parent.height*0.1
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Image
        {

            anchors.fill: parent
            source: "resources/left.svg"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                passReg.text =  ""
                nameReg.text = ""
                infoReg.text=  ""
                mainview.currentIndex = 0
            }
            onPressed:{
                back.color  = "gray"
            }
            onReleased:    {
                back.color  = "white"
            }
        }
    }
    Column{
        width: nextwindow.width/3
        height: nextwindow.height*0.4
        anchors.centerIn: parent
        id: secondPage

        Rectangle{
            id:loginRegister
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                color:"blue"
                 border.color: "black"
                height: parent.height
                width: parent.width*0.3
                Text {
                    text: "Логин"
                    anchors.centerIn: parent
                }
            }
            TextField{
                id:logRegister
                height: parent.height
                width: parent.width*0.7
                anchors.right: parent.right
            }
        }
        Rectangle{
            id:passwordRegister
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                color:"blue"
                 border.color: "black"
                height: parent.height
                width: parent.width*0.3
                Text {
                    text: "Пароль"
                    anchors.centerIn: parent
                }
            }
            TextField{
                id:passReg
                echoMode:TextInput.Password
                passwordCharacter:"*"
                height: parent.height
                width: parent.width*0.7
                anchors.right: parent.right
            }
            Image {
                width: parent.width/8
                    height:parent.height/1.5
                    source: "resources/eye.svg"
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    MouseArea{
                        anchors.fill: parent
                        onPressAndHold:  {
                            passReg.echoMode = TextInput.Normal
                        }
                        onReleased: {passReg.echoMode = TextInput.Password}

                    }
            }
        }
        Rectangle{
            id:nameRegister
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                 border.color: "black"
                color:"blue"
                height: parent.height
                width: parent.width*0.3
                Text {
                    text: "Имя"
                    anchors.centerIn: parent
                }
            }
            TextField{
                id:nameReg
                height: parent.height
                width: parent.width*0.7
                anchors.right: parent.right
            }
        }
        Rectangle{
            id:surNameRegister
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                 border.color: "black"
                color:"blue"
                height: parent.height
                width: parent.width*0.3
                Text {
                    text: "Фамилия"
                    anchors.centerIn: parent
                }
            }
            TextField{
                id:surNameReg
                height: parent.height
                width: parent.width*0.7
                anchors.right: parent.right
            }
        }
        Rectangle{
            id:infoRegister
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                color:"blue"
                 border.color: "black"
                height: parent.height
                width: parent.width*0.3
                Text {
                    text: "О себе"
                    anchors.centerIn: parent
                }
            }
            TextField{
                id:infoReg
                height: parent.height
                width: parent.width*0.7
                anchors.right: parent.right
            }
        }
        Rectangle{
            id:registerButton
            color:"gray"
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            radius: 4
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    // mainview.currentIndex = 0
                    // pass.clear()
                    //log.clear()
                    if(logRegister.text === "" || passReg.text === ""||nameReg.text === ""){
                        errorState2.visible = true
                    }
                    else{
                        connectClass.registerPerson(logRegister.text,passReg.text,nameReg.text,surNameReg.text,infoReg.text);
                        errorState2.visible = false
                        mainview.currentIndex = 0
                        registerOk.call()
                        logRegister.text=""
                        passReg.text =  ""
                        nameReg.text = ""
                        infoReg.text=  ""
                        surNameReg.text=""
                    }
                }
                onPressed: {
                    registerButton.color = "green"

                }
                onReleased: {
                    registerButton.color = "gray"
                }
            }
            Text {
                anchors.centerIn: parent
                text: "Зарегестрировать"
            }
        }

    }

}
