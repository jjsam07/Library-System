       IDENTIFICATION DIVISION.
       PROGRAM-ID. SearchBook.
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

       PROCEDURE DIVISION.
           OPEN INPUT BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   DISPLAY "Library record does not exist"
                   EXIT PROGRAM
               END-IF

               CALL "HeadMessage" USING "SEARCH BOOKS"

               DISPLAY "Enter Book Name to search: " WITH NO ADVANCING
               ACCEPT BOOKNAME
               READ BOOKRECORD INTO BOOK-WS
                   KEY IS BOOKNAME
                   INVALID KEY DISPLAY "Not found"
                   NOT INVALID KEY PERFORM ShowBookDetails
               END-READ

           CLOSE BOOKRECORD.
           EXIT PROGRAM.

       ShowBookDetails.
           DISPLAY "ID: " BOOK-ID-WS.
           DISPLAY "Name: " BOOKNAME-WS.
           DISPLAY "Author: " AUTHORNAME-WS.
           DISPLAY "Available?: " BAVAIL-WS.
           DISPLAY "Date issued: " DD-WS "/" MM-WS "/" YYYY-WS.
           DISPLAY " ".
