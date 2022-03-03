       IDENTIFICATION DIVISION.
       PROGRAM-ID. WelcomeMessage.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 DUMMY-WS PIC X.
       
       SCREEN SECTION.
       COPY welcome-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
       ACCEPT WELCOME-SCREEN.
       DISPLAY CLEAR-SCREEN.
       EXIT PROGRAM.
