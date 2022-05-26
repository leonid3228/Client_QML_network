#ifndef WORKER_H
#define WORKER_H
#include "connection.h"
#include <QObject>
#include <QStringList>
class Worker:public QObject
{
    Q_OBJECT
public:
    Worker();
    Q_INVOKABLE void getLogPass(const QString& log,const QString& pass);
    Q_INVOKABLE  void registerPerson(const QString &, const QString &, const QString &name,
                                     const QString &surName, const QString &info);
signals:
    void accesChanged(bool sendAcess);
    void dataChange(QString login,QString name,QString surName,QString info);
    void registerChanged(bool regState);
private:
    Connection connection;
private slots:
    void loginState(bool);
    void dataReturn(QVariantList);
    void registerReturn(bool);
};

#endif // WORKER_H
