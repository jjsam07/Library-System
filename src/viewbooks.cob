       IDENTIFICATION DIVISION.
       PROGRAM-ID. ViewBooks.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BOOKRECORD ASSIGN TO "library.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS BOOK-ID
           ALTERNATE RECORD KEY IS BOOKNAME
           FILE STATUS IS FILE-STATUS-WS.

       DATA DIVISION.
       FILE SECTION.
       FD BOOKRECORD.
       COPY bookrecord-fs.
       
       WORKING-STORAGE SECTION.
       COPY bookrecord-ws.
       
       01 EOF-WS PIC A VALUE "N".
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       PROCEDURE DIVISION.
           OPEN INPUT BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   DISPLAY "Library record does not exist"
                   EXIT PROGRAM
               END-IF

               CALL "HeadMessage" USING "VIEW BOOK DETAILS".

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
           DISPLAY "Available?: " BAVAIL-WS.
           DISPLAY "Date issued: " DD-WS "/" MM-WS "/" YYYY-WS.
           DISPLAY " ".
