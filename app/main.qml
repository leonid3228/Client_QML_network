import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import Connection 1.0
Window {
    id:mainWindow
    visible: true
    width: 900
    height: 600
    title: qsTr("Регистрация")
    x:Screen.desktopAvailableWidth*0.3
    y:Screen.desktopAvailableHeight*0.3
    Connect{
        id:connectClass
    }
    signal registerOk;
    SwipeView {
        id: mainview
        interactive:false
        currentIndex: 0
        anchors.fill: parent

        CheckWindow{id:exitWindow}
        PersonInfo{}
        NewPerson{}
    }

}
