       IDENTIFICATION DIVISION.
       PROGRAM-ID. StudentMenu.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.
       77 DUMMY-WS PIC X.
       
       SCREEN SECTION.
       COPY farewell-screen.
       COPY invalid-input-screen.
       COPY student-menu-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           PERFORM UNTIL 1 < 0
      *    DISPLAY " "
      *    DISPLAY "STUDENT MAIN MENU"
      *    DISPLAY "1. SEARCH BOOKS"
      *    DISPLAY "2. VIEW BOOKS"
      *    DISPLAY "3. BORROW/RETURN BOOKS"
      *    DISPLAY "0. EXIT"
      *    DISPLAY "ENTER CHOICE: " WITH NO ADVANCING
           ACCEPT STUDENT-MENU-SCREEN
           DISPLAY CLEAR-SCREEN
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "SearchBook"
                   WHEN 2
                       CALL "ViewBooks"
                   WHEN 3
                       CALL "BorrowBooks"
                   WHEN 0
                       EXIT PROGRAM
                   WHEN OTHER
                       ACCEPT INVALID-INPUT-SCREEN
      *                ACCEPT DUMMY-WS
                       DISPLAY CLEAR-SCREEN
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
