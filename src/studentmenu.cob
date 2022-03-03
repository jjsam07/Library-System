       IDENTIFICATION DIVISION.
       PROGRAM-ID. StudentMenu.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENTRECORD ASSIGN TO "student.bin"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS STUDENT-ID
           FILE STATUS IS FILE-STATUS-WS.
           
       DATA DIVISION.
       FILE SECTION.
       FD STUDENTRECORD.
       COPY studentrecord-fs.
       
       WORKING-STORAGE SECTION.
       01 OPTION-WS PIC 9.
       77 DUMMY-WS PIC X.
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       
       LINKAGE SECTION.
       01 STUDENT-ID-LS PIC 9(10).
       
       SCREEN SECTION.
       COPY delete-acc-confirmation-screen.
       COPY delete-acc-success-screen.
       COPY farewell-screen.
       COPY invalid-input-screen.
       COPY student-menu-screen.
       COPY clear-screen.

       PROCEDURE DIVISION USING STUDENT-ID-LS.
           PERFORM UNTIL 1 < 0
           ACCEPT STUDENT-MENU-SCREEN
           DISPLAY CLEAR-SCREEN
               EVALUATE OPTION-WS
                   WHEN 1
                       CALL "SearchBook"
                   WHEN 2
                       CALL "ViewBooks"
                   WHEN 3
                       CALL "BorrowBooks" USING BY CONTENT STUDENT-ID-LS
                   WHEN 4
                       ACCEPT DELETE-ACC-CONFIRMATION-SCREEN
                       IF DUMMY-WS = "Y" OR DUMMY-WS = "y"
                           MOVE STUDENT-ID-LS TO STUDENT-ID
                           OPEN I-O STUDENTRECORD
                               DELETE STUDENTRECORD RECORD
                                   NOT INVALID KEY PERFORM DeleteSuccess
                               END-DELETE
                           CLOSE STUDENTRECORD
                           EXIT PROGRAM
                       END-IF
                   WHEN 0
                       EXIT PROGRAM
                   WHEN OTHER
                       ACCEPT INVALID-INPUT-SCREEN
                       DISPLAY CLEAR-SCREEN
               END-EVALUATE
           END-PERFORM.
       EXIT PROGRAM.
       
       DeleteSuccess.
           ACCEPT DELETE-ACC-SUCCESS-SCREEN.
           DISPLAY CLEAR-SCREEN.
               
