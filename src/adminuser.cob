       IDENTIFICATION DIVISION.
       PROGRAM-ID. adminuser.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.

       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
           DISPLAY "LOGIN"
           DISPLAY "[1] ADMIN"
           DISPLAY "[2] STUDENT"
           DISPLAY "[0] EXIT"
           DISPLAY "ENTER CHOICE: " WITH NO ADVANCING
           ACCEPT OPTION-WS
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "Menu"
                       EXIT PERFORM
                   WHEN 2
                       CALL "StudentMenu"
                       EXIT PERFORM
                   WHEN 0
                       DISPLAY "Thank you come again next time"
                       STOP RUN
                   WHEN OTHER
                       DISPLAY "INVALID INPUT!!! Try again..."
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
