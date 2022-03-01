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
       COPY bookrecord-fs.

       WORKING-STORAGE SECTION.
       77 DUMMY-WS PIC X.
       COPY bookrecord-ws.

       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       
       SCREEN SECTION.
       COPY book-not-found-screen.
       COPY deletebook-cancel-screen.
       COPY deletebook-confirmation-screen.
       COPY deletebook-success-screen.
       COPY deletebook-screen.
       COPY library-does-not-exist-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           OPEN I-O BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT LIBRARY-DOES-NOT-EXIST-SCREEN
      *            ACCEPT DUMMY-WS
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF

      *        DISPLAY " "
      *        DISPLAY "Enter ID of book to be deleted: " WITH NO
      *        ADVANCING
      *        ACCEPT BOOK-ID
               ACCEPT DELETEBOOK-SCREEN

               READ BOOKRECORD INTO BOOK-WS
                   INVALID KEY PERFORM BookNotFound
                   NOT INVALID KEY PERFORM DeleteConfirmation
               END-READ

               IF DUMMY-WS = "Y" OR DUMMY-WS = "y"
                   DELETE BOOKRECORD RECORD
                       INVALID KEY PERFORM BookNotFound
                       NOT INVALID KEY PERFORM DeleteSuccess
                   END-DELETE
               ELSE
                   ACCEPT DELETEBOOK-CANCEL-SCREEN
               END-IF

           CLOSE BOOKRECORD.
           EXIT PROGRAM.
       
       DeleteConfirmation.
           ACCEPT DELETEBOOK-CONFIRMATION-SCREEN.
      *    ACCEPT DUMMY-WS.
           DISPLAY CLEAR-SCREEN.
           
       DeleteSuccess.
           ACCEPT DELETEBOOK-SUCCESS-SCREEN.
      *    ACCEPT DUMMY-WS.
           DISPLAY CLEAR-SCREEN.
           
       BookNotFound.
           ACCEPT BOOK-NOT-FOUND-SCREEN.
      *    ACCEPT DUMMY-WS.
           DISPLAY CLEAR-SCREEN.
