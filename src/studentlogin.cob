       IDENTIFICATION DIVISION.
       PROGRAM-ID. studentlogin.

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
       COPY studentrecord-ws.
       
       01 OPTION-WS PIC 9.
       77 ID-WS PIC X(10).
       77 DUMMY-WS PIC X.
       
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
       
       SCREEN SECTION.
       COPY enter-id-screen.
       COPY student-not-found-screen.
       COPY student-rec-not-found-screen.
       COPY welcome-student-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
       OPEN INPUT STUDENTRECORD
           IF FILE-DOES-NOT-EXIST-WS
               ACCEPT STUDENT-REC-NOT-FOUND-SCREEN
               DISPLAY CLEAR-SCREEN
               EXIT PROGRAM
           END-IF
           
           ACCEPT ENTER-ID-SCREEN
           
           READ STUDENTRECORD INTO STUDENT-WS
               INVALID KEY PERFORM StudentNotFound
               NOT INVALID KEY PERFORM ProceedToMenu
           END-READ
       CLOSE STUDENTRECORD.
       EXIT PROGRAM.
       
       StudentNotFound.
           ACCEPT STUDENT-NOT-FOUND-SCREEN.
           DISPLAY CLEAR-SCREEN.
           CLOSE STUDENTRECORD.
           EXIT PROGRAM.
           
       ProceedToMenu.
           ACCEPT WELCOME-STUDENT-SCREEN.
           CALL "StudentMenu" USING BY CONTENT STUDENT-ID-WS.
