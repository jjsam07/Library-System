       IDENTIFICATION DIVISION.
       PROGRAM-ID. MainProgram.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 DUMMY-WS PIC X.
       
       PROCEDURE DIVISION.
           CALL "WelcomeMessage".
           PERFORM UNTIL 1 < 0
               CALL "login"
           END-PERFORM
           STOP RUN.
