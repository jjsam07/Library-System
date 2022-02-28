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
       COPY bookrecord-ws.
       
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
