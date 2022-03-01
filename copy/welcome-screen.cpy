       01 WELCOME-SCREEN.
       05 FILLER AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           10 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.

      *    Part 1: Top
           10 FILLER LINE 2 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "¿".

      *    Part 2: Top
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "¿ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 3: Content
      *    Content: Line 1
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "          Welcome        ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 2
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "            to           ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 3
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "          Library        ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 4
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "         Management      ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 5
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "           System        ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 6
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "                         ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 7
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "Press any to continue...".
               15 PIC X(1) TO DUMMY-WS.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 4: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "À".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE " ³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 5: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "À".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 6: Bottom
           10 FILLER LINE + 1 COL 4.
               15 FILLER BACKGROUND-COLOR 0.
                   20 VALUE "                               ".
