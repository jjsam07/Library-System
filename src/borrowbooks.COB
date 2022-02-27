                  IDENTIFICATION DIVISION.
       PROGRAM-ID. BorrowBook.
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
       01 BOOK.
           05 BOOK-ID PIC 9(10).
           05 BOOKNAME PIC X(50).
           05 AUTHORNAME PIC X(50).
           05 STUDENTNAME PIC X(50).
           05 STUDENTADDR PIC X(300).
           05 ISSUE-DATE.
               10 MM PIC 9(2).
               10 DD PIC 9(2).
               10 YYYY PIC 9(4).
       01 BORROWBOOK.
           05 BBOOK-ID PIC 9(10).
           05 BORROWDATE.
               10 BMM PIC 9(2).
               10 BDD PIC 9(2).
               10 BYYYY PIC 9(4).
       01 BAVAIL PIC X.
       WORKING-STORAGE SECTION.
       01 BOOK-WS.
           05 BOOK-ID-WS PIC 9(10).
           05 BOOKNAME-WS PIC X(50).
           05 AUTHORNAME-WS PIC X(50).
           05 STUDENTNAME-WS PIC X(50).
           05 STUDENTADDR-WS PIC X(300).
           05 ISSUE-DATE-WS.
               10 MM-WS PIC 9(2).
               10 DD-WS PIC 9(2).
               10 YYYY-WS PIC 9(4).
       01 BORROWBOOK-WS.
           05 BBOOK-ID-WS PIC 9(10).
           05 BORROWDATE-WS.
               10 BMM-WS PIC 9(2).
               10 BDD-WS PIC 9(2).
               10 BYYYY-WS PIC 9(4).
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       01 Choice PIC 9(9).
       01 StayOpen PIC X Value 'Y'.
       01 BAVAIL-WS PIC X Value 'Y'.
       PROCEDURE DIVISION.
       StartPara.
           OPEN I-O BOOKRECORD
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
           CLOSE BOOKRECORD
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
               DISPLAY "Return "
               END-READ

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
               OPEN EXTEND BOOKRECORD
               IF BAVAIL-WS = 'Y'
                   MOVE 'N' TO BAVAIL-WS
               ELSE
                   MOVE 'Y' TO BAVAIL-WS
           DISPLAY " ".
       BorrowDetails.
           DISPLAY "Student Name: " WITH NO ADVANCING
           ACCEPT STUDENTNAME
           DISPLAY "Student address: " WITH NO ADVANCING
           ACCEPT STUDENTADDR
           DISPLAY "Date Borrowed (DD/MM/YYYY): " WITH NO ADVANCING
           ACCEPT BORROWDATE
           DISPLAY "Return within 3 days" .
           DISPLAY " ".
       ReturnBooks.
           DISPLAY " "
           DISPLAY "Enter Book ID to be Returned : " WITH NO ADVANCING
           Accept BOOK-ID.
           DELETE BOOKRECORD
                INVALID KEY DISPLAY "KEY Doesn't Exist"
           END-DELETE.
