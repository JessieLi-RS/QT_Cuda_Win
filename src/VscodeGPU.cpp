#include "VscodeGPU.h"

VscodeGPU::VscodeGPU(QWidget* parent)
    : QMainWindow(parent)
    , ui(new Ui_VscodeGPU)
{
    ui->setupUi(this);
}

VscodeGPU::~VscodeGPU()
{
    delete ui; 
}