#include<package.h>

Package::Package()
{

}

Package::Package(PckgType pckg):m_dataStream(&m_rawData,QIODevice::ReadWrite),m_pckg(pckg)
{
  m_dataStream.setVersion(QDataStream::Qt_DefaultCompiledVersion);
}
Package::Package(QVariantList &data, PckgType pckg):Package(pckg)
{
    m_data = data;
    flowConverrt();
}
void Package::flowConverrt()
{
    m_dataStream<<static_cast<int>(m_pckg)<<m_data;
}

QDataStream &operator>>(QDataStream &stream, Package &pckg)
{
    int type;
    stream>>type;
    pckg.m_pckg = static_cast<PckgType>(type);

    QVariantList data;
    stream>>data;
    pckg.m_data = data;

    pckg.flowConverrt();
    return stream;
}

QByteArray Package::rawData() const
{
    return m_rawData;
}

PckgType Package::pckg() const
{
    return m_pckg;
}

QVariantList Package::data() const
{
    return m_data;
}

