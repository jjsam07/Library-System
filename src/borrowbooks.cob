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
       COPY bookrecord-ws.
       
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       01 Choice PIC 9(9).
       01 StayOpen PIC X Value 'Y'.
       01 LbExists PIC X.

       PROCEDURE DIVISION.
       StartPara.
           PERFORM UNTIL StayOpen='N'
               DISPLAY " "
               DISPLAY "BORROW or RETURN?"
               DISPLAY "[1] - BORROW "
               DISPLAY "[2] - RETURN "
               DISPLAY "[0] - QUIT"
               DISPLAY ": " WITH NO ADVANCING
               ACCEPT Choice
               EVALUATE Choice
                   WHEN 1 PERFORM BorrowBooks
                   WHEN 2 PERFORM ReturnBooks
                   WHEN OTHER MOVE 'N' TO StayOpen
               END-EVALUATE
           END-PERFORM.
           STOP RUN.

       BorrowBooks.
           OPEN INPUT BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   DISPLAY "Library record does not exist"
                   EXIT PROGRAM
               END-IF

               DISPLAY "Input BOOK ID: " WITH NO ADVANCING
               ACCEPT BOOK-ID
               READ BOOKRECORD INTO BOOK-WS
                   KEY IS BOOK-ID
                   INVALID KEY DISPLAY "No records found"
                   NOT INVALID KEY PERFORM BorrowDetails
                   PERFORM ShowBookDetails
               END-READ
               IF BAVAIL-WS = 'Y'
                   MOVE 'N' TO BAVAIL-WS
                   WRITE BOOK FROM BOOK-WS
               END-IF
           CLOSE BOOKRECORD.
           EXIT PROGRAM.

       ShowBookDetails.
           DISPLAY "ID: " BOOK-ID-WS.
           DISPLAY "Name: " BOOKNAME-WS.
           DISPLAY "Author: " AUTHORNAME-WS.
           DISPLAY "Student: " STUDENTNAME-WS.
           DISPLAY "Student address: " STUDENTADDR-WS.
           DISPLAY "Date issued: " DD-WS "/" MM-WS "/" YYYY-WS.
           DISPLAY "Date Borrowed: " BDD-WS "/" BMM-WS "/" BYYYY-WS.
           DISPLAY " ".

       BorrowDetails.
           DISPLAY "Student Name: " WITH NO ADVANCING
           ACCEPT STUDENTNAME-WS
           DISPLAY "Student address: " WITH NO ADVANCING
           ACCEPT STUDENTADDR-WS
           DISPLAY "Date Borrowed (DD/MM/YYYY): " WITH NO ADVANCING
           ACCEPT BORROWDATE-WS
           DISPLAY "Return within 3 days" .
           DISPLAY " ".

       ReturnBooks.
           DISPLAY " "
           DISPLAY "Enter Book ID to be Returned : " WITH NO ADVANCING
           Accept BOOK-ID.
           READ BOOKRECORD INTO BOOK-ID
                INVALID KEY MOVE 'N' TO LbExists
           END-READ
           IF LbExists ='N'
               DISPLAY "Book Doesn't Exist"
           ELSE
               DISPLAY "ID: " BOOK-ID-WS
               DISPLAY "Name: " BOOKNAME-WS
               DISPLAY "Author: " AUTHORNAME-WS
               DISPLAY "Student: " STUDENTNAME-WS
               DISPLAY "THANK YOU"
               IF BAVAIL-WS = 'N'
                   MOVE 'Y' TO BAVAIL-WS
               END-IF
           END-IF.
