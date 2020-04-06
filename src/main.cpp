#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "dictionary.h"
#include "wordlist.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Dictionary myData;

    engine.rootContext()->setContextProperty("myData", &myData);
    qmlRegisterType<WordList>("space.developers", 1, 0, "WordList");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
