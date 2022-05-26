import QtQuick 2.0
Item {
    id:nextwindow
    width: 640
    height: 480
    Rectangle{
        id:back
        width: parent.width*0.07
        height: parent.height*0.1
        anchors.verticalCenter: parent.verticalCenter
        Image
        {
            anchors.fill: parent
            source: "resources/left.svg"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainview.currentIndex = 0
                exitWindow.name =  ""
                exitWindow.surName = ""
                exitWindow.info=  ""
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
        height: nextwindow.height/2
        anchors.centerIn: parent
        id: secondPage
        Text{
            text:"Информация о пользователе"
        }
        Row{
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                  color:"blue"
                width: parent.width*0.35
                height: parent.height
                border.color: "black"
                Text {
                    anchors.centerIn: parent
                    text: "Ваш логин"
                }
            }

            Rectangle{

                id:login
                border.color: "black"
                width: parent.width*0.65
                height: parent.height
                Text {
                    anchors.margins: 15
                    anchors.left:  login.left
                    anchors.verticalCenter:  parent.verticalCenter

                    text: exitWindow.login
                }}

        }
        Row{
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                   color:"blue"
                width: parent.width*0.35
                height: parent.height
                border.color: "black"
                Text {
                    anchors.centerIn: parent
                    text: "Ваше Имя"
                }
            }

            Rectangle{

                id:name
                border.color: "black"
                width: parent.width*0.65
                height: parent.height
                Text {
                    anchors.margins: 15
                    anchors.left:  parent.left
                    anchors.verticalCenter:  parent.verticalCenter

                    text: exitWindow.name
                }
            }
        }
        Row{
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                  color:"blue"
                width: parent.width*0.35
                height: parent.height
                border.color: "black"
                Text {
                    anchors.centerIn: parent
                    text: "Ваша Фамилия"
                }
            }

            Rectangle{

                id:surName
                border.color: "black"
                width: parent.width*0.65
                height: parent.height
                Text {
                    anchors.margins: 15
                    anchors.left:  parent.left
                    anchors.verticalCenter:  parent.verticalCenter

                    text: exitWindow.surName
                }
            }
        }
        Row{
            width: parent.width*1.2
            height: parent.height/4
            Rectangle{
                  color:"blue"
                width: parent.width*0.35
                height: parent.height
                border.color: "black"
                Text {
                    anchors.centerIn: parent
                    text: "Информация"
                }
            }
            Rectangle{
                id:info

                border.color: "black"
                width: parent.width*0.65
                height: parent.height
                Text {
                    anchors.margins: 15
                    anchors.left:  parent.left
                    anchors.verticalCenter:  parent.verticalCenter
                    text: exitWindow.info
                }
            }
        }
    }
}
