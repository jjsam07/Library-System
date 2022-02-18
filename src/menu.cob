       IDENTIFICATION DIVISION.
       PROGRAM-ID. Menu.
       
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.
       
       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
           DISPLAY "MAIN MENU"
           DISPLAY "1. ADD BOOKS"
           DISPLAY "2. SEARCH BOOKS"
           DISPLAY "3. VIEW BOOKS"
           DISPLAY "4. DELETE BOOKS"
      *    DISPLAY "5. UPDATE PASSWORD"
           DISPLAY "0. EXIT"
           DISPLAY "ENTER CHOICE: " WITH NO ADVANCING
           ACCEPT OPTION-WS
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "AddBook"
                       EXIT PERFORM
                   WHEN 2
                       CALL "SearchBook"
                       EXIT PERFORM
                   WHEN 3
                       CALL "ViewBooks"
                       EXIT PERFORM
                   WHEN 4
                       CALL "DeleteBook"
                       EXIT PERFORM
      *            WHEN 5
      *                PERFORM updatecredentials
      *                EXIT PERFORM
                   WHEN 0
                       DISPLAY "Thank you come again next time"
                       EXIT PERFORM
                   WHEN OTHER
                       DISPLAY "INVALID INPUT!!! Try again..."
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
