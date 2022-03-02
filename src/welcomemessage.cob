       IDENTIFICATION DIVISION.
       PROGRAM-ID. WelcomeMessage.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 DUMMY-WS PIC X.
       
       SCREEN SECTION.
       COPY welcome-screen.
       COPY clear-screen.

       PROCEDURE DIVISION.
       ACCEPT WELCOME-SCREEN.
      *ACCEPT DUMMY-WS.
      *    //headMessage("COBOL GROUP 1");
      *    MOVE "COBOL GROUP 1" TO HEAD-MESSAGE.
      *    CALL "HeadMessage" USING HEAD-MESSAGE.
      *    DISPLAY "  **-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-*
      *    "*-**-**".
      *    DISPLAY "        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      *    "-=".
      *    DISPLAY "        =                 WELCOME                  
      *    " =".
      *    DISPLAY "        =                   TO                     
      *    " =".
      *    DISPLAY "        =                 LIBRARY                  
      *    " =".
      *    DISPLAY "        =               MANAGEMENT                 
      *    " =".
      *    DISPLAY "        =                 SYSTEM                   
      *    " =".
      *    DISPLAY "        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      *    "-=".
      *    DISPLAY "  **-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-*
      *    "*-**-**".
      *    DISPLAY " Enter any key to continue.....".
      *    //getch();
       DISPLAY CLEAR-SCREEN.
       EXIT PROGRAM.
