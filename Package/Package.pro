QT+=core
CONFIG+=c++11
TEMPLATE = lib
DESTDIR =$$PWD/../shared/lib


HEADERS +=include/package.h \
    include/type.h

SOURCES += \
    src/package.cpp

INCLUDEPATH += $$PWD/include

headers.path = ../shared/include
headers.files =include/package.h \
    include/type.h
INSTALLS += headers
