       IDENTIFICATION DIVISION.
       PROGRAM-ID. HeadMessage.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       LINKAGE SECTION.
       01 STRING-MESSAGE-LS PIC X ANY LENGTH.

       PROCEDURE DIVISION USING STRING-MESSAGE-LS.
      *    //system(cls);
           DISPLAY "###################################################
      -    "########################".
           DISPLAY "############
      -    "            ############".
           DISPLAY "############      LIBRARY MANAGEMENT SYSTEM PROJECT
      -    " in COBOL   ############".
           DISPLAY "############
      -    "            ############".
           DISPLAY "###################################################
      -    "########################".
           DISPLAY "---------------------------------------------------
      -    "------------------------".
      *    //printMessageCenter(message);
           CALL "PrintMessageCenter" USING STRING-MESSAGE-LS.
           DISPLAY "---------------------------------------------------
      -    "-------------------------".
           EXIT PROGRAM.
