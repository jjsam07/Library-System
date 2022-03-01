       IDENTIFICATION DIVISION.
       PROGRAM-ID. login.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.
       77 DUMMY-WS PIC X.
       
       SCREEN SECTION.
       COPY login-screen.
       COPY farewell-screen.
       COPY invalid-input-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
      *    DISPLAY "LOGIN"
      *    DISPLAY "[1] ADMIN"
      *    DISPLAY "[2] STUDENT"
      *    DISPLAY "[0] EXIT"
      *    DISPLAY "ENTER CHOICE: " WITH NO ADVANCING
           ACCEPT LOGIN-SCREEN
           DISPLAY CLEAR-SCREEN
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "adminmenu"
                       EXIT PERFORM
                   WHEN 2
                       CALL "StudentMenu"
                       EXIT PERFORM
                   WHEN 0
                       ACCEPT FAREWELL-SCREEN
      *                ACCEPT DUMMY-WS
                       DISPLAY CLEAR-SCREEN
                       STOP RUN
                   WHEN OTHER
                       ACCEPT INVALID-INPUT-SCREEN
      *                ACCEPT DUMMY-WS
                       DISPLAY CLEAR-SCREEN
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
