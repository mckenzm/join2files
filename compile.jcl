//HERCxxC  JOB (COBOL),'Load Module',CLASS=C,MSGCLASS=X,
//             REGION=8M,TIME=1440,MSGLEVEL=(2,1),NOTIFY=HERCxx
//********************************************************************
//* Compile COBOL code from a library, writing the load module to a
//* LOADLIB member for subsequent on demand use.
//********************************************************************
//BUILD      EXEC COBUCL,
//  PARM.COB='FLAGW,LOAD,SUPMAP,SIZE=2048K,BUF=1024K'
//COB.SYSLIB   DD DSN=SYS1.COBLIB,DISP=SHR
//COB.SYSPUNCH DD DUMMY
//COB.SYSIN    DD DISP=SHR,DSN=HERCxx.PDS.COBOL(STACKEX1)
//LKED.SYSLMOD DD DISP=SHR,DSN=HERCxx.PDS.LOADLIB(STACKEX1)
