#include "connection.h"
#include "QDebug"
#include "QDataStream"
Connection::Connection(){
    connectServer();
    connect(&m_socket, &QAbstractSocket::readyRead,
            this, &Connection::onDataRecieved);
}
void Connection::connectServer()
{
    m_socket.connectToHost("127.0.0.1",5555);
}

void Connection::login(QVariantList data)
{
    Package  pckg(data,PckgType::REQUEST_LOGIN);
    m_socket.write(pckg.rawData());
}

void Connection::registerPerson(QVariantList data)
{
    Package  pckg(data,PckgType::REQUEST_REGISTER);
    m_socket.write(pckg.rawData());
}

void Connection::onDataRecieved()
{
    QDataStream in{&m_socket};
    in.setVersion(QDataStream::Qt_DefaultCompiledVersion);
    forever {
        in.startTransaction();
        Package inputPackage;
        in >> inputPackage;

        if (!in.commitTransaction())
        {
            break;
        }
        qDebug() << "Тип пакета" << static_cast<int>(inputPackage.pckg());
        handlePackage(inputPackage);
    }
}

void Connection::handlePackage(const Package &package)
{
    switch (package.pckg())
    {
    case PckgType::REQUEST_LOGIN:
    {
        if(package.data().at(0).toBool()==true)
            emit loginReturn(true);
        if(package.data().at(0).toBool()==false)
            emit loginReturn(false);
        break;
    }
    case PckgType::REQUEST_DATA:
    {
        emit DataFromDataBase(package.data());
        break;
    }
    case PckgType::REQUEST_REGISTER_OK:
    {
        emit registred(package.data().at(0).toBool());
        break;
    }
    default: {
        qDebug() << "НЕВАЛИДНЫЙ ПАКЕТ!";
    }
    }
}





