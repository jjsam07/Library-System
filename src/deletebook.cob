       IDENTIFICATION DIVISION.
       PROGRAM-ID. DeleteBook.
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
           05 BOOK-EXISTS PIC 9.
           05 BOOK-NOT-FOUND PIC 9.
       01 OPTION-WS PIC 9.
       01 BkExists Pic X.
       01 EOF-WS PIC A VALUE "N".
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.

       PROCEDURE DIVISION.
           OPEN I-O BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   DISPLAY "Library record does not exist"
                   EXIT PROGRAM
               END-IF

               DISPLAY " "
               DISPLAY "Enter ID of book to be deleted: " WITH NO
               ADVANCING
               ACCEPT BOOK-ID

               READ BOOKRECORD INTO BOOK-WS
                   INVALID KEY MOVE 'N' TO BkExists
               END-READ.
               IF BkExists='N'
                   DISPLAY " "
                   DISPLAY "BOOK DOES NOT EXIST."
                   DISPLAY " "
                   DISPLAY " "
                   MOVE 'Y' TO BkExists
                   CALL "Menu" USING "DeleteBook"
               ELSE
                   READ BOOKRECORD INTO BOOK-WS
                   PERFORM ShowBookDetails
                   PERFORM UNTIL 1 < 0
                   DISPLAY " "
                   DISPLAY "Are you sure to delete this book?"
                   DISPLAY "[1] - YES"
                   DISPLAY "[2] - NO"
                   DISPLAY "[0] - EXIT"
                   DISPLAY " "
                   DISPLAY "Enter your choice: "
                   WITH NO ADVANCING
                   ACCEPT OPTION-WS
                   EVALUATE OPTION-WS
                       WHEN 1 PERFORM DelBook

                       WHEN 2
                           CALL "DeleteBook" USING "DeleteBook"
                           ACCEPT BOOK-ID
                       WHEN 0
                           DISPLAY "THANK YOU COME AGAIN NEXT TIME."
                       WHEN OTHER
                       DISPLAY "INVALID INPUT. PLEASE TRY AGAIN."
                   END-EVALUATE
                   END-PERFORM
               END-IF
               EXIT PROGRAM.

       ShowBookDetails.
           DISPLAY " "
           DISPLAY "ID: " BOOK-ID-WS.
           DISPLAY "Name: " BOOKNAME-WS.
           DISPLAY "Author: " AUTHORNAME-WS.
           DISPLAY "Date issued: " DD-WS "/" MM-WS "/" YYYY-WS.


       DelBook.
               DELETE BOOKRECORD RECORD
                   NOT INVALID KEY DISPLAY "BOOK HAS BEEN DELETED."
                   DISPLAY " "
                   DISPLAY " "
                   DISPLAY " "
                   DISPLAY " "
                   DISPLAY " "
               END-DELETE
               CALL "Menu" USING "Main"
           EXIT PROGRAM.
