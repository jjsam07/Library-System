       IDENTIFICATION DIVISION.
       PROGRAM-ID. ViewBooks.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT BOOKRECORD ASSIGN TO "library.txt"
            ORGANIZATION IS INDEXED
            ACCESS MODE IS SEQUENTIAL
            RECORD KEY IS BOOKNAME.
            
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
       
       01 EOF-WS PIC A VALUE "N".
       PROCEDURE DIVISION.
           CALL "HeadMessage" USING "VIEW BOOKS DETAILS".
           OPEN INPUT BOOKRECORD
               PERFORM UNTIL EOF-WS = "Y"
                   READ BOOKRECORD INTO BOOK-WS
                   AT END MOVE "Y" TO EOF-WS
                   NOT AT END PERFORM ShowBookDetails
               END-PERFORM
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
        
       ShowBookDetails.
           DISPLAY "ID: " BOOK-ID-WS.
           DISPLAY "Name: " BOOKNAME-WS.
           DISPLAY "Author: " AUTHORNAME-WS.
           DISPLAY "Student: " STUDENTNAME-WS.
           DISPLAY "Student address: " STUDENTADDR-WS.
           DISPLAY "Date issued: " DD-WS "/" MM-WS "/" YYYY-WS.
           DISPLAY " ".
