       IDENTIFICATION DIVISION.
       PROGRAM-ID. WelcomeMessage.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 HEAD-MESSAGE PIC X(13).

       PROCEDURE DIVISION.
      *    //headMessage("COBOL GROUP 1");
           MOVE "COBOL GROUP 1" TO HEAD-MESSAGE.
           CALL "HeadMessage" USING HEAD-MESSAGE.
           DISPLAY "  **-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-"
      -    "**-**-**".
           DISPLAY "        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
      -    "=-=".
           DISPLAY "        =                 WELCOME                 "
      -    "  =".
           DISPLAY "        =                   TO                    "
      -    "  =".
           DISPLAY "        =                 LIBRARY                 "
      -    "  =".
           DISPLAY "        =               MANAGEMENT                "
      -    "  =".
           DISPLAY "        =                 SYSTEM                  "
      -    "  =".
           DISPLAY "        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
      -    "=-=".
           DISPLAY "  **-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-"
      -    "**-**-**".
           DISPLAY " Enter any key to continue.....".
      *    //getch();
           EXIT PROGRAM.
