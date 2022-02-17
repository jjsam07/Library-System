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
       
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       
       PROCEDURE DIVISION.
           OPEN I-O BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   DISPLAY "Library record does not exist"
                   EXIT PROGRAM
               END-IF
               
               CALL "HeadMessage" USING "Delete Book"
               
               DISPLAY "Enter ID of book to be deleted: " WITH NO ADVAN
      -        CING
               ACCEPT BOOK-ID
               
               READ BOOKRECORD INTO BOOK-WS
                   INVALID KEY DISPLAY "Not found"
                   NOT INVALID KEY DISPLAY BOOKNAME-WS "will be deleted"
               END-READ
               
               DELETE BOOKRECORD RECORD
                   INVALID KEY DISPLAY "Not found"
                   NOT INVALID KEY DISPLAY "Book deleted"
               END-DELETE
               
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
