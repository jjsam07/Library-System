       IDENTIFICATION DIVISION.
       PROGRAM-ID. Menu.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.

       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
           DISPLAY " "
           DISPLAY "ADMIN MAIN MENU"
           DISPLAY "1. ADD BOOKS"
           DISPLAY "2. SEARCH BOOKS"
           DISPLAY "3. VIEW BOOKS"
           DISPLAY "4. DELETE BOOKS"
           DISPLAY "0. EXIT"
           DISPLAY "ENTER CHOICE: " WITH NO ADVANCING

           ACCEPT OPTION-WS
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "AddBook"
                       EXIT PERFORM
                   WHEN 2
                       CALL "ASearchBook"
                       EXIT PERFORM
                   WHEN 3
                       CALL "SViewBooks"
                       EXIT PERFORM
                   WHEN 4
                       CALL "DeleteBook"
                       EXIT PERFORM
                   WHEN 0
                       DISPLAY "Thank you come again next time"
                       STOP RUN
                   WHEN OTHER
                       DISPLAY "INVALID INPUT!!! Try again..."
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
