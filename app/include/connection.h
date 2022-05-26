#ifndef CONNECTION_H
#define CONNECTION_H
#include<QObject>
#include<QTcpSocket>
#include<QVariantList>
#include<type.h>
#include<package.h>
class Connection:public QObject
{
    Q_OBJECT
public:
    Connection();
     void login(QVariantList data);
     void registerPerson(QVariantList data);
private:
    QTcpSocket m_socket;
    void connectServer();
    void handlePackage(const Package &);
private slots:
    void onDataRecieved();
signals:
    void loginReturn(bool);
    void DataFromDataBase(QVariantList);
    void registred(bool);
};

#endif // CONNECTION_H
