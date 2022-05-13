//HERCxxS JOB (BAL),'Run Stack',CLASS=A,MSGCLASS=X,NOTIFY=HERCxx,
//            TIME=1,MSGLEVEL=(2,1),REGION=8M
//********************************************************************
//* Housekeeping, a tolerant delete...
//********************************************************************
//CLEAN  EXEC PGM=IDCAMS,COND=(0,NE)
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
 DELETE HERCxx.STACKEX.OUTFILE
 IF MAXCC < 9 THEN SET MAXCC = 0
/*
//********************************************************************
//* Run a COBOL program from a loadlib.
//********************************************************************
//STACK  EXEC PGM=STACKEX1,COND=(0,NE)
//STEPLIB  DD DSN=HERCxx.PDS.LOADLIB,DISP=SHR
//INFIL1   DD DISP=(SHR),DSN=HERCxx.STACKEX.INFILE1
//INFIL2   DD DISP=(SHR),DSN=HERCxx.STACKEX.INFILE2
//OUTFIL   DD DSN=HERCxx.STACKEX.OUTFILE,DISP=(MOD,CATLG,KEEP),
//    DCB=(RECFM=FB,LRECL=16,BLKSIZE=3120),
//    SPACE=(TRK,(1,1)),UNIT=SYSDA
