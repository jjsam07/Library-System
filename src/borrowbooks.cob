       IDENTIFICATION DIVISION.
       PROGRAM-ID. BorrowBooks.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BOOKRECORD ASSIGN TO "library.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS BOOK-ID
           ALTERNATE RECORD KEY IS BOOKNAME
           FILE STATUS IS FILE-STATUS-WS.

       DATA DIVISION.
       FILE SECTION.
       FD BOOKRECORD.
       COPY bookrecord-fs.

       WORKING-STORAGE SECTION.
       77 DUMMY-WS PIC X.
       COPY bookrecord-ws.

       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       01 Choice PIC 9.
       
       SCREEN SECTION.
       COPY book-not-found-screen.
       COPY borrower-details-screen.
       COPY borrow-screen.
       COPY borrow-return-menu-screen.
       COPY borrow-book-details-screen.
       COPY library-does-not-exist-screen.
       COPY return-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
       StartPara.
           PERFORM UNTIL 1 < 0
               ACCEPT BORROW-RETURN-MENU-SCREEN
               EVALUATE Choice
                   WHEN 1 PERFORM BorrowBooks
                   WHEN 2 PERFORM ReturnBooks
                   WHEN 0 EXIT PROGRAM
               END-EVALUATE
           END-PERFORM.
           EXIT PROGRAM.

       BorrowBooks.
           OPEN I-O BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT LIBRARY-DOES-NOT-EXIST-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF

               ACCEPT BORROW-SCREEN
               READ BOOKRECORD INTO BOOK-WS
                   KEY IS BOOK-ID
                   INVALID KEY PERFORM BookNotFound
                   NOT INVALID KEY PERFORM BorrowDetails
                   PERFORM ShowBookDetails
               END-READ
               IF BAVAIL-WS = 'Y'
                   MOVE 'N' TO BAVAIL-WS
                   REWRITE BOOK FROM BOOK-WS
               END-IF
           CLOSE BOOKRECORD.
           EXIT PROGRAM.

       ShowBookDetails.
           ACCEPT BORROW-BOOK-DETAILS-SCREEN.
           DISPLAY CLEAR-SCREEN.

       BorrowDetails.
           ACCEPT BORROWER-DETAILS-SCREEN.
           DISPLAY CLEAR-SCREEN.
       
       ReturnBooks.
           OPEN I-O BOOKRECORD
               Accept RETURN-SCREEN.
               READ BOOKRECORD INTO BOOK-WS
                    INVALID KEY PERFORM BookNotFound
                    NOT INVALID KEY PERFORM ShowBookDetails
               END-READ
                   IF BAVAIL-WS = 'N'
                       MOVE 'Y' TO BAVAIL-WS
                       REWRITE BOOK FROM BOOK-WS
                   END-IF
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
           
       BookNotFound.
           ACCEPT BOOK-NOT-FOUND-SCREEN.
           DISPLAY CLEAR-SCREEN.
