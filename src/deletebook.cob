       IDENTIFICATION DIVISION.
       PROGRAM-ID. DeleteBook.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BOOKRECORD ASSIGN TO "library.bin"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS BOOK-ID
           ALTERNATE RECORD KEY IS BOOKNAME
           FILE STATUS IS FILE-STATUS-WS.
           
           SELECT OPTIONAL BORROWRECORD ASSIGN TO "borrow.bin"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS BBOOK-ID
           FILE STATUS IS FILE-STATUS-WS.

       DATA DIVISION.
       FILE SECTION.
       FD BOOKRECORD.
       COPY bookrecord-fs.
       FD BORROWRECORD.
       COPY borrowrecord-fs.

       WORKING-STORAGE SECTION.
       77 DUMMY-WS PIC X.
       COPY bookrecord-ws.
       COPY borrowrecord-ws.

       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       
       SCREEN SECTION.
       COPY book-not-found-screen.
       COPY borrow-rec-not-found-screen.
       COPY deletebook-confirmation-screen.
       COPY deletebook-not-allowed-screen.
       COPY deletebook-success-screen.
       COPY deletebook-screen.
       COPY library-does-not-exist-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           OPEN I-O BOOKRECORD
           OPEN I-O BORROWRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT LIBRARY-DOES-NOT-EXIST-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF

               ACCEPT DELETEBOOK-SCREEN
               MOVE BOOK-ID TO BBOOK-ID

               READ BOOKRECORD INTO BOOK-WS
                   INVALID KEY PERFORM BookNotFound
                   NOT INVALID KEY PERFORM DeleteConfirmation
               END-READ

               IF DUMMY-WS = "Y" OR DUMMY-WS = "y"
                   READ BORROWRECORD INTO BBOOK-WS
                       INVALID KEY PERFORM DeleteBook
                       NOT INVALID KEY PERFORM DeleteNotAllowed
                   END-READ
               END-IF

           CLOSE BORROWRECORD.
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
       
       DeleteNotAllowed.
           ACCEPT DELETEBOOK-NOT-ALLOWED-SCREEN.
           DISPLAY CLEAR-SCREEN.
           CLOSE BORROWRECORD.
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
       
       DeleteBook.
           DELETE BOOKRECORD RECORD
               INVALID KEY PERFORM BookNotFound
               NOT INVALID KEY PERFORM DeleteSuccess
           END-DELETE.
       
       DeleteConfirmation.
           ACCEPT DELETEBOOK-CONFIRMATION-SCREEN.
           DISPLAY CLEAR-SCREEN.
           
       DeleteSuccess.
           ACCEPT DELETEBOOK-SUCCESS-SCREEN.
           DISPLAY CLEAR-SCREEN.
           CLOSE BORROWRECORD.
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
           
       BookNotFound.
           ACCEPT BOOK-NOT-FOUND-SCREEN.
           DISPLAY CLEAR-SCREEN.
           CLOSE BORROWRECORD.
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
