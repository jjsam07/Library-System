       IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltut.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           SELECT BookFile ASSIGN TO "Customer.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS bID.
       DATA DIVISION.
       FILE SECTION.
       FD BookFile.           
       01 BookData.
              02 bID PIC 99.
              02 AName PIC X(15).
              02 BkName PIC X(15).
       WORKING-STORAGE SECTION.
       01 Choice PIC 9.
       01 StayOpen PIC X Value 'Y'.
       01 LbExists PIC X.
       
       PROCEDURE DIVISION.
       StartPara.
           OPEN I-O BookFile
           PERFORM UNTIL StayOpen='N'
               DISPLAY " "
               DISPLAY "CUSTOMER RECORDS"
               DISPLAY "1 - ADD BOOK"
               DISPLAY "2 - DELETE BOOK"
               DISPLAY "3 - UPDATE BOOK"
               DISPLAY "4 - GET BOOK DETAILS"
               DISPLAY "0 - QUIT"
               DISPLAY ": " WITH NO ADVANCING
               ACCEPT Choice
               EVALUATE Choice
                   WHEN 1 PERFORM AddBook
                   WHEN 2 PERFORM DeleteBook
                   WHEN 3 PERFORM UpdateBook
                   WHEN 4 PERFORM GetBook
                   WHEN OTHER MOVE 'N' TO StayOpen
               END-EVALUATE
           END-PERFORM.
           CLOSE BookFile
           STOP RUN.
           
           AddBook.
               DISPLAY " "
               DISPLAY "Enter Book ID : " WITH NO ADVANCING.
               ACCEPT bID
               DISPLAY "Enter Author's Name : " WITH NO ADVANCING.
               ACCEPT AName
               DISPLAY "Enter Book Name : " WITH NO ADVANCING
               Accept BkName
           WRITE BookData 
               INVALID KEY DISPLAY "ID Taken"
           END-WRITE.
               
           DeleteBook.
               DISPLAY " "
               DISPLAY "Enter Book ID to Delete : " WITH NO ADVANCING
               Accept bID.
               DELETE BookFile
                   INVALID KEY DISPLAY "KEY Doesn't Exist"
               END-DELETE.
           
           UpdateBook.
               MOVE 'Y' TO LbExists
               DISPLAY " "
               DISPLAY "Enter ID to Update : " WITH NO ADVANCING.
               ACCEPT bID.
               READ BookFile
                   INVALID KEY MOVE 'N' TO LbExists
               END-READ.
               IF LbExists='N'
                   DISPLAY "Book ID Doesn't Exist"
               ELSE 
                   DISPLAY "Enter the Author's Name : " WITH NO 
                   ADVANCING
                   Accept AName
                   DISPLAY "Enter the Book Name : " WITH NO ADVANCING
                   Accept BkName
               END-IF.
               REWRITE BookData
                   INVALID KEY DISPLAY "Book Not Updated"
               END-REWRITE.
               
           GetBook.
               MOVE 'Y' TO LbExists
               DISPLAY " "
               DISPLAY "Enter ID to Find : " WITH NO ADVANCING.
               ACCEPT bID.
               READ BookFile
                   INVALID KEY MOVE 'N' TO LbExists
               END-READ
               IF LbExists='N'
                   DISPLAY "Book Doesn't Exist"
               ELSE
                   DISPLAY "ID : " bID
                   DISPLAY "Author's Name : " AName
                   DISPLAY "Book Name : " BkName
              END-IF.
