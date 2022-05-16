      *-------------------------------------------------------------*
      *  STACKEX1 : Join two files in a particular way.             *
      *  https://stackoverflow.com/q/72174841/1734032               *
      *-------------------------------------------------------------*
       IDENTIFICATION DIVISION.
      *------------------------*
       PROGRAM-ID.  'STACKEX1'.

       ENVIRONMENT DIVISION.
      *---------------------*
       CONFIGURATION SECTION.

       SOURCE-COMPUTER.  IBM-360.
       OBJECT-COMPUTER.  IBM-360.

       INPUT-OUTPUT SECTION.
      *---------------------*
       FILE-CONTROL.
           SELECT INFILE1 ASSIGN TO UT-S-INFIL1.
           SELECT INFILE2 ASSIGN TO UT-S-INFIL2.
           SELECT OUTFILE ASSIGN TO UT-S-OUTFIL.

       DATA DIVISION.
      *--------------*
       FILE SECTION.
       FD  INFILE1
           RECORDING MODE IS F
           RECORD CONTAINS 8 CHARACTERS
           BLOCK  CONTAINS 1 RECORDS
           LABEL RECORDS ARE OMITTED
           DATA RECORD IS INREC1.
       01  INREC1                 PIC X(8).

       FD  INFILE2
           RECORDING MODE IS F
           RECORD CONTAINS 8 CHARACTERS
           BLOCK  CONTAINS 100 RECORDS
           LABEL RECORDS ARE OMITTED
           DATA RECORD IS INREC2.
       01  INREC2                 PIC X(8).

       FD  OUTFILE
           RECORDING MODE IS F
           RECORD CONTAINS  16 CHARACTERS
           BLOCK  CONTAINS  50 RECORDS
           LABEL RECORDS ARE OMITTED
           DATA RECORD IS OUTREC.
       01  OUTREC                 PIC X(16).


       WORKING-STORAGE SECTION.
      *------------------------*
       01  SW-SWITCHES.
           05 END-OF-FILE-IND     PIC X VALUE SPACE.
              88 SW-END-OF-FILE         VALUE 'Y'.

       01  SC-VARIABLES.
           05 SC-JOINED-RECORD.
              10 SC-1ST-HALF      PIC X(8).
              10 SC-2ND-HALF      PIC X(8).


       PROCEDURE DIVISION.
      *-------------------*
       00-MAINLINE.
           PERFORM 10-SETUP THROUGH 10-EXIT
           PERFORM 20-LOOP  THROUGH 20-EXIT
              UNTIL SW-END-OF-FILE.
           PERFORM 30-FINISH.

      *                          ANS COBOL (1972) NO FILE STATUS.
       10-SETUP.
           OPEN INPUT  INFILE1 INFILE2
           OPEN OUTPUT OUTFILE
           READ INFILE1 INTO SC-1ST-HALF AT END PERFORM 30-FINISH.
           READ INFILE2 INTO SC-2ND-HALF AT END PERFORM 30-FINISH.

       10-EXIT.
           EXIT.


       20-LOOP.
           WRITE OUTREC  FROM SC-JOINED-RECORD
           READ  INFILE2 INTO SC-2ND-HALF
              AT END MOVE 'Y' TO END-OF-FILE-IND.

       20-EXIT.
           EXIT.

      *                         typical housekeeping.
       30-FINISH.
           CLOSE INFILE1 INFILE2 OUTFILE
           STOP RUN.
