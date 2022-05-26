#include "worker.h"
Worker::Worker()
{
    connect(&connection,&Connection::loginReturn,this,&Worker::loginState);
    connect(&connection,&Connection::DataFromDataBase,this,&Worker::dataReturn);
    connect(&connection,&Connection::registred,this,&Worker::registerReturn);
}

void Worker::getLogPass(const QString &log, const QString &pass)
{
    QVariantList listLogAndPass;
    listLogAndPass.append(log);
    listLogAndPass.append(pass);
    connection.login(listLogAndPass);
}

void Worker::loginState(bool state)
{  
    emit accesChanged(state);
}

void Worker::registerReturn(bool state)
{
    emit registerChanged(state);
}

void Worker::dataReturn(QVariantList data)
{
    emit dataChange(data.at(0).toString(),data.at(1).toString(),data.at(2).toString(),data.at(3).toString());
}
void Worker::registerPerson(const QString &log, const QString & pas,const QString &name,
                            const QString &surName,const QString &info)
{
    QVariantList listLogAndPass;
    listLogAndPass.append(log);
    listLogAndPass.append(pas);
    listLogAndPass.append(name);
    listLogAndPass.append(surName);
    listLogAndPass.append(info);
    connection.registerPerson(listLogAndPass);
}
