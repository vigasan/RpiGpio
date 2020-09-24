#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "gpio.h"

static void isrInput1();
static void isrInput2();

static GPIO input1(0, GPIO_INPUT, isrInput1);
static GPIO input2(1, GPIO_INPUT, isrInput2);

static void isrInput1()
{
    input1.isrCallback();
}

static void isrInput2()
{
    input2.isrCallback();
}


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;

    GPIO gpio13(13, GPIO_OUTPUT);
    GPIO gpio4(4, GPIO_PWM);
    GPIO gpio5(5, GPIO_PWM);
    GPIO gpio6(6, GPIO_PWM);

    QQmlContext* ctx = engine.rootContext();
    ctx->setContextProperty("input1", &input1);
    ctx->setContextProperty("input2", &input2);
    ctx->setContextProperty("output", &gpio13);
    ctx->setContextProperty("pwmBlue", &gpio4);
    ctx->setContextProperty("pwmGreen", &gpio5);
    ctx->setContextProperty("pwmRed", &gpio6);


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
