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
       01 BAVAIL PIC X.
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
       01 BAVAIL-WS PIC X.
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

           CALL "HeadMessage" USING "ADD NEW BOOKS".

           DISPLAY "               ADD BOOKS".
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
