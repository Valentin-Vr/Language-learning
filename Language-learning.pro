QT += quick widgets

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        src/dictionary.cpp \
        src/main.cpp \
        src/wordlist.cpp

RESOURCES += qml/qml.qrc

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/data.h \
    src/dictionary.h \
    src/wordlist.h

INCLUDEPATH += src
