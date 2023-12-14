#pragma once
#include "ui_VscodeGPU.h"
#include <QMainWindow>

class VscodeGPU : public QMainWindow {
    Q_OBJECT
    
public:
    VscodeGPU(QWidget* parent = nullptr);
    ~VscodeGPU();

private:
    Ui_VscodeGPU* ui;
};