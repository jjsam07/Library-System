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
       77 DUMMY-WS PIC X.
       77 BEGINNING-OF-RECORD PIC X.
       77 END-OF-RECORD PIC X.
       
       COPY bookrecord-ws.
       COPY screenio.
       
       01 EOF-WS PIC A VALUE "N".
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       
       SCREEN SECTION.
       COPY beginning-of-record-screen.
       COPY end-of-record-screen.
       COPY view-book-details-screen.
       COPY library-does-not-exist-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
           OPEN INPUT BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT LIBRARY-DOES-NOT-EXIST-SCREEN
      *            ACCEPT DUMMY-WS
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF
               
               READ BOOKRECORD INTO BOOK-WS
                       AT END ACCEPT END-OF-RECORD-SCREEN
                       NOT AT END PERFORM ShowBookDetails
               END-READ
               
               PERFORM UNTIL 1 < 0
                   EVALUATE COB-CRT-STATUS
                       WHEN COB-SCR-F1
                           IF BEGINNING-OF-RECORD = "N" THEN
                               READ BOOKRECORD PREVIOUS INTO BOOK-WS
                                   AT END PERFORM BeginningOfRecord
                                   NOT AT END PERFORM ShowBookDetails
                               END-READ
                           ELSE
                               EXIT PERFORM
                           END-IF
                       WHEN COB-SCR-F2
                           IF END-OF-RECORD = "N" THEN
                               READ BOOKRECORD NEXT INTO BOOK-WS
                                   AT END PERFORM EndOfRecord
                                   NOT AT END PERFORM ShowBookDetails
                               END-READ
                            ELSE
                                EXIT PERFORM
                           END-IF
                       WHEN COB-SCR-F5
                           IF BEGINNING-OF-RECORD = "Y" THEN
                               PERFORM BeginningOfRecord
                           END-IF
                           
                           IF END-OF-RECORD = "Y" THEN
                               PERFORM EndOfRecord
                           END-IF
                           
                           IF BEGINNING-OF-RECORD = "N" AND
                           END-OF-RECORD = "N" THEN
                               EXIT PERFORM
                           END-IF
                       WHEN OTHER
                           IF BEGINNING-OF-RECORD = "Y" THEN
                               PERFORM BeginningOfRecord
                           END-IF
                           
                           IF END-OF-RECORD = "Y" THEN
                               PERFORM EndOfRecord
                           END-IF
                           
                           IF BEGINNING-OF-RECORD = "N" AND
                           END-OF-RECORD = "N" THEN
                               PERFORM ShowBookDetails
                           END-IF
                   END-EVALUATE
               END-PERFORM

           CLOSE BOOKRECORD.
           EXIT PROGRAM.
           
       ShowBookDetails.
      *    DISPLAY " "
      *    DISPLAY "ID: " BOOK-ID-WS.
      *    DISPLAY "Name: " BOOKNAME-WS.
      *    DISPLAY "Author: " AUTHORNAME-WS.
      *    DISPLAY "Available?: " BAVAIL-WS.
      *    DISPLAY "Date issued: " DD-WS "/" MM-WS "/" YYYY-WS.
      *    DISPLAY " ".
           MOVE "N" TO BEGINNING-OF-RECORD.
           MOVE "N" TO END-OF-RECORD.
           ACCEPT VIEW-BOOK-DETAILS-SCREEN.
           DISPLAY CLEAR-SCREEN.
       
       BeginningOfRecord.
           MOVE "Y" TO BEGINNING-OF-RECORD.
           ACCEPT BEGINNING-OF-RECORD-SCREEN.
           DISPLAY CLEAR-SCREEN.
           
       EndOfRecord.
           MOVE "Y" TO END-OF-RECORD.
           ACCEPT END-OF-RECORD-SCREEN.
           DISPLAY CLEAR-SCREEN.
