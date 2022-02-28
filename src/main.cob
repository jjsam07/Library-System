       IDENTIFICATION DIVISION.
       PROGRAM-ID. MainProgram.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       PROCEDURE DIVISION.
           CALL "WelcomeMessage".
           PERFORM UNTIL 1 < 0
               CALL "adminuser"
           END-PERFORM
           STOP RUN.
