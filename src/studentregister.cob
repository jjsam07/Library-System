       IDENTIFICATION DIVISION.
       PROGRAM-ID. studentregister.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL STUDENTRECORD ASSIGN TO "student.bin"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS STUDENT-ID
           FILE STATUS IS FILE-STATUS-WS.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENTRECORD.
       COPY studentrecord-fs.
       
       WORKING-STORAGE SECTION.
       COPY studentrecord-ws.
       
       77 DUMMY-WS PIC X.
       
       01 EOF-WS PIC A VALUE "N".
       01 FILE-STATUS-WS PIC X(2).
           88 FILE-SUCCESS VALUE 00.
           88 FILE-DOES-NOT-EXIST-WS VALUE 35.
           
       SCREEN SECTION.
       COPY reg-file-operation-error-screen.
       COPY register-screen.
       COPY register-success-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
       OPEN EXTEND STUDENTRECORD
           ACCEPT REGISTER-SCREEN
           DISPLAY CLEAR-SCREEN
           WRITE STUDENT
           IF NOT FILE-SUCCESS
               ACCEPT REG-FILE-OPERATION-ERROR-SCREEN
               DISPLAY CLEAR-SCREEN
           ELSE
               ACCEPT REGISTER-SUCCESS-SCREEN
           END-IF
       CLOSE STUDENTRECORD.
       EXIT PROGRAM.
