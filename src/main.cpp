#include "VscodeGPU.h"
#include "algorithm.h"
#include <QApplication>
#pragma comment(lib, "user32.lib")

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    test_cuda();
    VscodeGPU w;
    w.show();
    return a.exec();
}