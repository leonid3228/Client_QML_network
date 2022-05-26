#pragma once
#include<QVariantList>
#include<QByteArray>
#include<QDataStream>
#include<type.h>
class Package{
public:
    Package();
    Package(PckgType);

    Package(QVariantList &,PckgType);

    friend QDataStream& operator>> (QDataStream& data,Package &pckg);
    QByteArray rawData() const;

    PckgType pckg() const;

    QVariantList data() const;

private:
    void flowConverrt();
    QByteArray m_rawData;
    QDataStream m_dataStream;
    PckgType m_pckg;
    QVariantList m_data;
};


