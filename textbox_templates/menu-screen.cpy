       01 MENU-SCREEN AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           05 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.

      *    Part 1: Top
           05 FILLER LINE 10 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "¿".

      *    Part 2: Top
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "¿ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 3: Content
      *    Content: Line 1
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "[1] Add a book".
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 2
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "[2] Search for a book".
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 3
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "[3] Browse library".
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 4
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "[4] Delete book".
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 5
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 6
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "Choice: ".
               10 PIC 10(10) TO YOUR-VARIABLE.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 4: Bottom
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "³ ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "À".
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE " ³".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 5: Bottom
           05 FILLER LINE + 1 COL 10.
               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   15 VALUE "À".
               10 FILLER FOREGROUND-COLOR 0.
                   15 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               10 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 6: Bottom
           05 FILLER LINE + 1 COL 12.
               10 FILLER BACKGROUND-COLOR 0.
                   15 VALUE "                            ".
