QT += core gui widgets

CONFIG += c++17

win32-msvc*:QMAKE_CXXFLAGS += /utf-8
# QMAKE_LFLAGS += "/MANIFESTUAC:\"level='requireAdministrator' uiAccess='false'\""

SOURCES += \
    $$files($$PWD/src/*.cpp)

HEADERS += \
    $$files($$PWD/src/*.h)

FORMS += $$PWD/src/VscodeGPU.ui

OBJECTS +=  $$PWD/build/debug/algorithm.obj

LIBS +=  D:/Env/cuda/v11.3/lib/x64/cuda.lib
LIBS +=  D:/Env/cuda/v11.3/lib/x64/cudart.lib
LIBS +=  D:/Env/cuda/v11.3/lib/x64/cudadevrt.lib
LIBS +=  D:/Env/cuda/v11.3/lib/x64/cudart_static.lib
LIBS +=  D:/Env/cuda/v11.3/lib/x64/cublas.lib
LIBS +=  D:/Env/cuda/v11.3/lib/x64/cublaslt.lib
LIBS +=  D:/Env/cuda/v11.3/lib/x64/cufft.lib


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target