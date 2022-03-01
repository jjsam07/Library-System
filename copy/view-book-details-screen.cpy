       01 VIEW-BOOK-DETAILS-SCREEN.
       05 FILLER AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           10 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.

      *    Part 1: Top
           10 FILLER LINE 2 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "¿".

      *    Part 2: Top
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
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
               15 VALUE "Book ID:     ".
               15 PIC 9(10) FROM BOOK-ID-WS.
               15 VALUE "                                        ".
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
               15 VALUE "Name:        ".
               15 PIC X(50) FROM BOOKNAME-WS.
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
               15 VALUE "Author:      ".
               15 PIC X(50) FROM AUTHORNAME-WS.
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
               15 VALUE "Available?:  ".
               15 PIC X(1) FROM BAVAIL-WS.
               15 VALUE "                                         ".
               15 VALUE "        ".
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
               15 VALUE "Date issued: ".
               15 PIC 9(2) FROM DD-WS.
               15 VALUE "/".
               15 PIC 9(2) FROM MM-WS.
               15 VALUE "/".
               15 PIC 9(4) FROM YYYY-WS.
               15 VALUE "                                        ".
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
               15 VALUE "                                         ".
               15 VALUE "                      ".
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
               15 VALUE "F1  Previous                             ".
               15 VALUE "                      ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 8
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "F2  Next                                 ".
               15 VALUE "                      ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 9
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "F5  Exit                                 ".
               15 VALUE "                      ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 10
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "³ ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "³".
               15 PIC X(1) TO DUMMY-WS.
               15 VALUE "                                         ".
               15 VALUE "                     ".
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
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE " ³".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 5: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "À".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
                   20 VALUE "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 6: Bottom
           10 FILLER LINE + 1 COL 4.
               15 FILLER BACKGROUND-COLOR 0.
                   20 VALUE "                                         ".
                   20 VALUE "                            ".
