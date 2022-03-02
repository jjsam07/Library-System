       IDENTIFICATION DIVISION.
       PROGRAM-ID. adminmenu.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.
       77 DUMMY-WS PIC X.
       
       SCREEN SECTION.
       COPY admin-menu-screen.
       COPY farewell-screen.
       COPY invalid-input-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
      *    DISPLAY " "
      *    DISPLAY "ADMIN MAIN MENU"
      *    DISPLAY "1. ADD BOOKS"
      *    DISPLAY "2. SEARCH BOOKS"
      *    DISPLAY "3. VIEW BOOKS"
      *    DISPLAY "4. DELETE BOOKS"
      *    DISPLAY "0. EXIT"
      *    DISPLAY "ENTER CHOICE: " WITH NO ADVANCING

           ACCEPT ADMIN-MENU-SCREEN
           DISPLAY CLEAR-SCREEN
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "AddBook"
                   WHEN 2
                       CALL "SearchBook"
                   WHEN 3
                       CALL "ViewBooks"
                   WHEN 4
                       CALL "DeleteBook"
                   WHEN 0
                       EXIT PROGRAM
                   WHEN OTHER
                       ACCEPT INVALID-INPUT-SCREEN
      *                ACCEPT DUMMY-WS
                       DISPLAY CLEAR-SCREEN
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
