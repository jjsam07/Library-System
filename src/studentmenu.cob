       IDENTIFICATION DIVISION.
       PROGRAM-ID. StudentMenu.
       
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.
       
       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
           DISPLAY "MAIN MENU"
           DISPLAY "1. SEARCH BOOKS"
           DISPLAY "2. VIEW BOOKS"
           DISPLAY "3. BORROW BOOKS"
     *     DISPLAY "4. BOOK LIST"
      *    DISPLAY "5. UPDATE PASSWORD"
           DISPLAY "0. EXIT"
           DISPLAY "ENTER CHOICE: " WITH NO ADVANCING
           ACCEPT OPTION-WS
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "SearchBook"
                       EXIT PERFORM
                   WHEN 2
                       CALL "ViewBooks"
                       EXIT PERFORM
                   WHEN 3
                       CALL "BorrowBooks"
                       EXIT PERFORM
      *            WHEN 4
      *                CALL "BOOK LIST"
      *                EXIT PERFORM
      *            WHEN 5
      *                PERFORM updatecredentials
      *                EXIT PERFORM
                   WHEN 0
                       DISPLAY "Thank you come again next time"
                       STOP RUN
                   WHEN OTHER
                       DISPLAY "INVALID INPUT!!! Try again..."
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
