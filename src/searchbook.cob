       IDENTIFICATION DIVISION.
       PROGRAM-ID. SearchBook.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BOOKRECORD ASSIGN TO "library.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS BOOK-ID
           ALTERNATE RECORD KEY IS BOOK-ID
           FILE STATUS IS FILE-STATUS-WS.

       DATA DIVISION.
       FILE SECTION.
       FD BOOKRECORD.
       COPY bookrecord-fs.

       WORKING-STORAGE SECTION.
       COPY bookrecord-ws.
       
       77 DUMMY-WS PIC X.
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       
       SCREEN SECTION.
       COPY book-show-details-screen.
       COPY book-not-found-screen.
       COPY library-does-not-exist-screen.
       COPY searchbook-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           OPEN INPUT BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT LIBRARY-DOES-NOT-EXIST-SCREEN
      *            ACCEPT DUMMY-WS
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF

      *        DISPLAY " "
      *        DISPLAY "Enter Book ID to search: " WITH NO ADVANCING
               ACCEPT SEARCHBOOK-SCREEN
               DISPLAY CLEAR-SCREEN
               READ BOOKRECORD INTO BOOK-WS
                   KEY IS BOOK-ID
                   INVALID KEY PERFORM BookNotFound
                   NOT INVALID KEY PERFORM ShowBookDetails
               END-READ

           CLOSE BOOKRECORD.
           EXIT PROGRAM.

       ShowBookDetails.
      *    DISPLAY "ID: " BOOK-ID-WS.
      *    DISPLAY "Name: " BOOKNAME-WS.
      *    DISPLAY "Author: " AUTHORNAME-WS.
      *    DISPLAY "Available?: " BAVAIL-WS.
      *    DISPLAY "Date issued: " DD-WS "/" MM-WS "/" YYYY-WS.
      *    DISPLAY " ".
           ACCEPT BOOK-SHOW-DETAILS-SCREEN.
      *    ACCEPT DUMMY-WS.
           DISPLAY CLEAR-SCREEN.
        
       BookNotFound.
           ACCEPT BOOK-NOT-FOUND-SCREEN.
      *    ACCEPT DUMMY-WS.
           DISPLAY CLEAR-SCREEN.
