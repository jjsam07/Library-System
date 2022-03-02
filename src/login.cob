       IDENTIFICATION DIVISION.
       PROGRAM-ID. login.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.
       77 PASSWORD-WS PIC X(10).
       77 DUMMY-WS PIC X.
       
       SCREEN SECTION.
       COPY enter-password-screen.
       COPY login-screen.
       COPY farewell-screen.
       COPY invalid-input-screen.
       COPY wrong-password-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
           ACCEPT LOGIN-SCREEN
           DISPLAY CLEAR-SCREEN
               EVALUATE OPTION-WS
                   WHEN 1
                       ACCEPT ENTER-PASSWORD-SCREEN
                       IF PASSWORD-WS = "password"
                           CALL "adminmenu"
                       ELSE
                           ACCEPT WRONG-PASSWORD-SCREEN
                       END-IF
                   WHEN 2
                       CALL "StudentMenu"
                   WHEN 0
                       ACCEPT FAREWELL-SCREEN
                       DISPLAY CLEAR-SCREEN
                       STOP RUN
                   WHEN OTHER
                       ACCEPT INVALID-INPUT-SCREEN
                       DISPLAY CLEAR-SCREEN
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
