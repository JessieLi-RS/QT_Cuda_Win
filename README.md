# QT_Cuda_Win
This is a small demo for processing Qt+Cuda code in Window platform using VSCode~

## STEP:
1. Create a Qt project in VSCode, choose qmake; 
2. Add the include path and the bin path in .pro and launch.json, respectively; 
3. Open a cmd widow, and build the xxx.cu file to generate a xxx.obj file;  
    the command is "nvcc -Xcompiler "/MDd" -D_DEBUG -c bilinear.cu";    
4. Add the following line to the .pro file; 
    "OBJECTS +=  $$PWD/build/debug/xxx.obj";    
5. Run your code.

## Tips:
It is highly recommended to use the system PATH for the cuda environment.   
And if you have other .dll files for the project, you can give the PATH as "${env:PATH};D:\\Env\\GLight\\bin" in the launch.json.
     