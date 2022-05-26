import QtQuick 2.9
import QtQuick.Controls 2.2


Item {
    property bool acess: false
    property bool registerState: false
    property string login: ""
    property string name: ""
    property string surName: ""
    property string info: ""

    Component.onCompleted:{ mainWindow.registerOk.connect(showregisterState) }
    function showregisterState()
    {
        registerState.visible = true
        _timerShow.running = true

    }
    Timer {
        id:_timerShow
        interval: 1500
        running: false
        repeat: false
        onTriggered: {
            registerState.visible = false
        }
    }
    Connections {
        target: connectClass
        onAccesChanged: {
            firstwindow.acess = sendAcess
        }
        onDataChange:{
            firstwindow.login = login
            firstwindow.name = name
            firstwindow.surName = surName
            firstwindow.info = info
        }
        onRegisterChanged: {
            firstwindow.registerState = regState
        }
    }

    id:firstwindow
    width: 640
    height: 480
    Column{

        width: firstwindow.width/3
        height: firstwindow.height/2
        anchors.centerIn: parent
        id: firstPage
        Rectangle{

            id:_login
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                color:"blue"
                height: parent.height
                width: parent.width*0.3
                Text {
                    text: "Логин"
                    anchors.centerIn: parent
                }
            }
            TextField{
                id:log
                height: parent.height
                width: parent.width*0.7
                anchors.right: parent.right
            }
        }
        Rectangle{
            id:password
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{

                color:"blue"
                height: parent.height
                width: parent.width*0.3
                Text {
                    text: "Пароль"
                    anchors.centerIn: parent
                }
            }
            TextField{
                id:pass
                echoMode:TextInput.Password
                passwordCharacter:"*"
                height: parent.height
                width: parent.width*0.7
                anchors.right: parent.right
            }
        }
        Rectangle{
            id:exitButton
            color:"gray"
            border.color: "black"
            width: parent.width*1.2
            height: parent.height/4
            radius: 4
            Timer {
                id: timer
                interval: 600
                running: false
                repeat: false
                onTriggered: {if (firstwindow.acess === true){
                        mainview.currentIndex = 1
                        errorState.visible = false
                    }
                    if (firstwindow.acess === false){
                        errorState.visible = true
                    }

                }
            }
            MouseArea{id:area
                anchors.fill: parent
                onClicked: {
                    if(log.text!= "" && pass.text!=  ""){
                        connectClass.getLogPass(log.text,pass.text)
                        pass.clear()
                        log.clear()
                        timer.start()
                        }
                }
                onPressed: {
                    exitButton.color = "green"

                }
                onReleased: {
                    exitButton.color = "gray"
                }
            }
            Text {
                anchors.centerIn: parent
                text: "Войти"
            }
        }
        Text {
            width: parent.width
            height: parent.height/8
            text: "Добавить нового пользователя"
            color: "blue"
            font{
                pointSize: 8
                bold: true
                underline: true
            }
            anchors.right: parent.right
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    errorState.visible = false
                    mainview.currentIndex = 2
                }
            }
        }
    }
    Rectangle{
        id:errorState
        visible : false
        color:"red"
        height: parent.height/10+10
        width: parent.width
        border.color: "black"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: "Неверный логин или пароль"
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id:registerState
        visible : false
        color:"green"
        height: parent.height/10+10
        width: parent.width
        border.color: "black"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: "Вы успешно зарегестрировались"
            anchors.centerIn: parent
        }
    }
}
