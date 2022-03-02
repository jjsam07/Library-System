       IDENTIFICATION DIVISION.
       PROGRAM-ID. AddBook.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL BOOKRECORD ASSIGN TO "library.txt"
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
       
       SCREEN SECTION.
       COPY addbook-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           OPEN EXTEND BOOKRECORD
               ACCEPT ADDBOOK-SCREEN
               DISPLAY CLEAR-SCREEN
               WRITE BOOK
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
