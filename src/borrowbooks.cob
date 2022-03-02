       IDENTIFICATION DIVISION.
       PROGRAM-ID. BorrowBooks.
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
           RECORD KEY IS BORROW-REF-ID
      *    ALTERNATE RECORD KEY IS BORROWER-ID
      *    WITH DUPLICATES
      *    ALTERNATE RECORD KEY IS BBOOK-ID
      *    WITH DUPLICATES
           FILE STATUS IS FILE-STATUS-WS.
           
           SELECT STUDENTRECORD ASSIGN TO "student.bin"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS STUDENT-ID
           FILE STATUS IS FILE-STATUS-WS.

       DATA DIVISION.
       FILE SECTION.
       FD BOOKRECORD.
       COPY bookrecord-fs.
       FD BORROWRECORD.
       COPY borrowrecord-fs.
       FD STUDENTRECORD.
       COPY studentrecord-fs.

       WORKING-STORAGE SECTION.
       77 DUMMY-WS PIC X.
       COPY bookrecord-ws.
       COPY borrowrecord-ws.
       COPY studentrecord-ws.

       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       01 Choice PIC 9.
       
       LINKAGE SECTION.
       01 STUDENT-ID-LS PIC 9(10).
       
       SCREEN SECTION.
       COPY book-not-available-screen.
       COPY book-not-found-screen.
       COPY borrow-rec-not-found-screen.
       COPY borrower-details-screen.
       COPY borrow-screen.
       COPY borrow-return-menu-screen.
       COPY borrow-book-details-screen.
       COPY did-not-borrow-screen.
       COPY did-not-borrow-book-screen.
       COPY library-does-not-exist-screen.
       COPY return-screen.
       COPY return-success.
       COPY student-rec-not-found-screen.
       COPY clear-screen.

       PROCEDURE DIVISION USING STUDENT-ID-LS.
       StartPara.
           PERFORM UNTIL 1 < 0
               ACCEPT BORROW-RETURN-MENU-SCREEN
               EVALUATE Choice
                   WHEN 1 PERFORM BorrowBooks
                   WHEN 2 PERFORM ReturnBooks
                   WHEN 0 EXIT PROGRAM
               END-EVALUATE
           END-PERFORM.
           EXIT PROGRAM.

       BorrowBooks.
           OPEN I-O BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT LIBRARY-DOES-NOT-EXIST-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF
           OPEN I-O BORROWRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT BORROW-REC-NOT-FOUND-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF
           OPEN I-O STUDENTRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT STUDENT-REC-NOT-FOUND-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF

               ACCEPT BORROW-SCREEN
               DISPLAY CLEAR-SCREEN
               MOVE BOOK-ID-WS TO BOOK-ID
               
               READ BOOKRECORD INTO BOOK-WS
                   INVALID KEY PERFORM BookNotFound
                   NOT INVALID KEY PERFORM BorrowerDetails
               END-READ
           CLOSE STUDENTRECORD.
           CLOSE BORROWRECORD.
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
       
       BorrowerDetails.
           IF QUANTITY-WS = 0
               ACCEPT BOOK-NOT-AVAILABLE-SCREEN
               DISPLAY CLEAR-SCREEN
           ELSE
               MOVE STUDENT-ID-LS TO BORROWER-ID
               MOVE BOOK-ID-WS TO BBOOK-ID
               READ BORROWRECORD INTO BBOOK-WS
                   INVALID KEY PERFORM AddBorrow
                   NOT INVALID KEY PERFORM UpdateExistingBorrow
               END-READ
           END-IF.
       
       AddBorrow.
           ADD 1 TO BQUANTITY.
           SUBTRACT 1 FROM QUANTITY-WS.
           MOVE STUDENT-ID-LS TO STUDENT-ID.
           READ STUDENTRECORD INTO STUDENT-WS.
           MOVE STUDENT-ID-LS TO BORROWER-ID.
           MOVE BOOK-ID-WS TO BBOOK-ID.
           REWRITE BOOK FROM BOOK-WS.
           WRITE BBOOK.
           PERFORM ShowBookDetails.
           
       UpdateExistingBorrow.
           ADD 1 TO BQUANTITY-WS.
           SUBTRACT 1 FROM QUANTITY-WS.
           MOVE STUDENT-ID-LS TO STUDENT-ID.
           READ STUDENTRECORD INTO STUDENT-WS.
           REWRITE BOOK FROM BOOK-WS.
           REWRITE BBOOK FROM BBOOK-WS.
           PERFORM ShowBookDetails.
       
       ReturnBooks.
           OPEN I-O BOOKRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT LIBRARY-DOES-NOT-EXIST-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF
           OPEN I-O BORROWRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT BORROW-REC-NOT-FOUND-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF
           OPEN I-O STUDENTRECORD
               IF FILE-DOES-NOT-EXIST-WS
                   ACCEPT STUDENT-REC-NOT-FOUND-SCREEN
                   DISPLAY CLEAR-SCREEN
                   EXIT PROGRAM
               END-IF

               ACCEPT RETURN-SCREEN
               DISPLAY CLEAR-SCREEN
               MOVE STUDENT-ID-LS TO BORROWER-ID
               MOVE BBOOK-ID-WS TO BBOOK-ID
               
               READ BORROWRECORD INTO BBOOK-WS
                   INVALID KEY PERFORM StudentBorrowRecordNil
                   NOT INVALID KEY PERFORM ProceedReturn
               END-READ
           CLOSE STUDENTRECORD.
           CLOSE BORROWRECORD.
           CLOSE BOOKRECORD.
           EXIT PROGRAM.
           
       StudentBorrowRecordNil.
           MOVE STUDENT-ID-LS TO STUDENT-ID.
           READ STUDENTRECORD INTO STUDENT-WS.
           ACCEPT DID-NOT-BORROW-SCREEN.
           DISPLAY CLEAR-SCREEN.
       
       ProceedReturn.
           MOVE STUDENT-ID-LS TO BORROWER-ID.
           MOVE BBOOK-ID-WS TO BBOOK-ID.
           READ BORROWRECORD INTO BBOOK-WS
               INVALID KEY PERFORM BookNotInStudentBorrowRecord
               NOT INVALID KEY PERFORM ReturnSuccess
           END-READ.
           
       BookNotInStudentBorrowRecord.
           MOVE STUDENT-ID-LS TO STUDENT-ID.
           READ STUDENTRECORD INTO STUDENT-WS.
           MOVE BBOOK-ID-WS TO BOOK-ID.
           READ BOOKRECORD INTO BOOK-WS.
           ACCEPT DID-NOT-BORROW-BOOK-SCREEN.
           DISPLAY CLEAR-SCREEN.
           
       ReturnSuccess.
           MOVE BBOOK-ID-WS TO BOOK-ID.
           READ BOOKRECORD INTO BOOK-WS.
           ADD 1 TO QUANTITY-WS.
           IF BQUANTITY-WS > 1
               SUBTRACT 1 FROM BQUANTITY-WS
               REWRITE BBOOK
           ELSE
               DELETE BORROWRECORD RECORD
           END-IF
           REWRITE BOOK FROM BOOK-WS.
           ACCEPT RETURN-SUCCESS.
           DISPLAY CLEAR-SCREEN.
       
       ShowBookDetails.
           ACCEPT BORROW-BOOK-DETAILS-SCREEN.
           DISPLAY CLEAR-SCREEN.
       
       BookNotFound.
           ACCEPT BOOK-NOT-FOUND-SCREEN.
           DISPLAY CLEAR-SCREEN.
