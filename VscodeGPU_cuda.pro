QT += core gui widgets

CONFIG += c++17

win32-msvc*:QMAKE_CXXFLAGS += /utf-8
# QMAKE_LFLAGS += "/MANIFESTUAC:\"level='requireAdministrator' uiAccess='false'\""

SOURCES += \
    $$files($$PWD/src/*.cpp)

HEADERS += \
    $$files($$PWD/src/*.h)

FORMS += $$PWD/src/VscodeGPU.ui


CUDA_PATH = "D:/Env/cuda/v11.3"
CUDA_INC +=  $$CUDA_PATH/include
CUDA_LIBS +=  $$CUDA_PATH/lib/x64/cuda.lib
CUDA_LIBS +=  $$CUDA_PATH/lib/x64/cudart.lib
CUDA_LIBS +=  $$CUDA_PATH/lib/x64/cudadevrt.lib
CUDA_LIBS +=  $$CUDA_PATH/lib/x64/cudart_static.lib
CUDA_LIBS +=  $$CUDA_PATH/lib/x64/cublas.lib
CUDA_LIBS +=  $$CUDA_PATH/lib/x64/cublaslt.lib
CUDA_LIBS +=  $$CUDA_PATH/lib/x64/cufft.lib

CUDA_SOURCES += src/algorithm.cu

QMAKE_LIBDIR += $$CUDA_DIR/lib/x64
SYSTEM_TYPE = 64
NVCCFLAGS = --use_fast_math
CUDA_INC = $$join("D:/Env/cuda/v11.3/include",'"-I"','-I"','"')

MSVCRT_LINK_FLAG_DEBUG = "/MDd"
MSVCRT_LINK_FLAG_RELEASE = "/MD"

CUDA_OBJECTS_DIR = ./

CONFIG(debug, debug|release) {
    # Debug mode
    cuda_d.input = CUDA_SOURCES
    cuda_d.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}.obj
    cuda_d.commands = $$CUDA_PATH/bin/nvcc.exe -D_DEBUG  algorithm.obj -c algorithm.cu
    cuda_d.dependency_type = TYPE_C
    QMAKE_EXTRA_COMPILERS += cuda_d
}
else {
    # Release mode
    cuda.input = CUDA_SOURCES
    cuda.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}algorithm.obj
    cuda.commands = $$CUDA_PATH/bin/nvcc.exe $$NVCC_OPTIONS $$CUDA_INC $$CUDA_LIBS --machine $$SYSTEM_TYPE \
        -arch=$$CUDA_ARCH -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME} -Xcompiler $$MSVCRT_LINK_FLAG_RELEASE
    cuda.dependency_type = TYPE_C
    QMAKE_EXTRA_COMPILERS += cuda
}


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target