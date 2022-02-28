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

       PROCEDURE DIVISION.
      *    OPEN EXTEND BOOKRECORD.
      *    IF FILE-DOES-NOT-EXIST-WS
      *        OPEN OUTPUT BOOKRECORD
      *        CLOSE BOOKRECORD
      *    ELSE
      *        CLOSE BOOKRECORD
      *    END-IF.
           DISPLAY " "
           DISPLAY "ADD BOOKS".
           DISPLAY "BOOK-ID:" WITH NO ADVANCING
           ACCEPT BOOK-ID.

           IF BOOK-ID = 0 THEN
               DISPLAY "file is not opened"
               STOP RUN
           ELSE
               OPEN EXTEND BOOKRECORD
                   DISPLAY "Book Name:" WITH NO ADVANCING
                   ACCEPT BOOKNAME

                   DISPLAY "Author's Name:" WITH NO ADVANCING
                   ACCEPT AUTHORNAME

                   DISPLAY "Book Issue Date (DD/MM/YYYY):" WITH NO
                   ADVANCING
                   ACCEPT ISSUE-DATE

                   DISPLAY "Book Availability: " WITH NO ADVANCING
                   ACCEPT BAVAIL

                   DISPLAY " "
                   WRITE BOOK
               CLOSE BOOKRECORD
           END-IF.
           CALL 'Menu' USING 'AddBook'.
