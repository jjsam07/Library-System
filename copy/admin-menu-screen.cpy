       01 ADMIN-MENU-SCREEN.
       05 FILLER AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           10 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.

      *    Part 1: Top
           10 FILLER LINE 2 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "Ú".
               15 VALUE " Admin: Main menu ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "Ä".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "¿".

      *    Part 2: Top
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
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
               15 VALUE "1. ADD BOOKS   ".
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
               15 VALUE "2. SEARCH BOOKS".
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
               15 VALUE "3. VIEW BOOKS  ".
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
               15 VALUE "4. DELETE BOOKS".
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
               15 VALUE "0. EXIT        ".
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
               15 VALUE "ENTER CHOICE: ".
               15 PIC 9(1) TO OPTION-WS.
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
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE " ³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 5: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "À".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 6: Bottom
           10 FILLER LINE + 1 COL 4.
               15 FILLER BACKGROUND-COLOR 0.
                   20 VALUE "                     ".
