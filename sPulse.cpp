#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME sPulse
#include "simstruc.h"
#include <math.h>
static void mdlInitializeSizes(SimStruct *S)  //flag 0
{
       ssSetNumSFcnParams(S,0);  // user's parameter unused
       if(ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) 
       {
         return ;  // check parameter
       } 
       {
         int_T i;
         if(!ssSetNumInputPorts(S,3)) return ;// set input 3 port 
         for(i=0;i<3;i++)
         {
           ssSetInputPortWidth(S,i,-1);
           ssSetInputPortDirectFeedThrough(S,i,1);
         }
       }
       {
         int_T i;
         if(!ssSetNumOutputPorts(S,2))return; // set output 2 port
         for(i=0;i<2;i++)
         {
            ssSetOutputPortWidth(S,i,-1);
         }
       }
       
       ssSetNumSampleTimes(S,1);
       ssSetNumRWork(S,0);
       ssSetNumIWork(S,0);
       ssSetNumPWork(S,0);
       ssSetNumModes(S,0);
       ssSetNumNonsampledZCs(S,0);
       
       ssSetOptions(S,SS_OPTION_EXCEPTION_FREE_CODE);
}

static void mdlInitializeSampleTimes(SimStruct *S) //
{
       ssSetSampleTime(S,0,ssGetInputPortSampleTime(S,1));
               //INHERITED_SAMPLE_TIME);
    ssSetOffsetTime(S,0,0.0);
}

double compute(double i,int value){
    double result=0;
    result=i/value;
    return result;
}
static void mdlOutputs(SimStruct *S,int_T tid) //flag 3
{
       int_T l=0;
       int_T i;
       int_T k;
       int_T y1Width = ssGetOutputPortWidth(S,0);
       int_T y2Width = ssGetOutputPortWidth(S,1);
       real_T *y1 = ssGetOutputPortRealSignal(S,0);
       real_T *y2 = ssGetOutputPortRealSignal(S,1);
       
       InputRealPtrsType uPtrs0 = ssGetInputPortRealSignalPtrs(S,0);
       InputRealPtrsType uPtrs1 = ssGetInputPortRealSignalPtrs(S,1);
       InputRealPtrsType uPtrs2 = ssGetInputPortRealSignalPtrs(S,2);
       
       double clock,pulse,constant;
       clock=*uPtrs0[0];
       pulse=*uPtrs1[0];
       constant=*uPtrs2[0];
       
       
       for(l=0;l<299;l++){
           double FirstR1=0,LastR1=0;
           double FirstR2=0,LastR2=0;
           FirstR1=compute(l,60);
           LastR1=compute(((2*l)+1),120);
           if(l>=1){
               FirstR2=compute(((2*l)-1),120);
               LastR2=compute(l,60);
           }          
           
           if((clock>=FirstR1)&&(clock<LastR1))
               *y1=pulse;
           if((clock>=FirstR2)&&(clock<LastR2))
               *y2=pulse;
       }
       
}
static void mdlTerminate(SimStruct *S) //flag 9
{}
#ifdef MATLAB_MEX_FILE
#include "simulink.c"
#else
#include "cg_sfun.h"
#endif 
