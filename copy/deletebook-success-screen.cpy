       01 DELETEBOOK-SUCCESS-SCREEN.
       05 FILLER AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           10 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.

      *    Part 1: Top
           10 FILLER LINE 2 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
                   20 VALUE "컴컴컴컴컴컴컴컴컴".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".

      *    Part 2: Top
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
                   20 VALUE "컴컴컴컴컴컴컴".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 3: Content
      *    Content: Line 1
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "Successfully deleted:                    ".
               15 VALUE "             ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 2
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "                                         ".
               15 VALUE "             ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 3
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "    ".
               15 PIC X(50) FROM BOOKNAME-WS.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 4
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "                                         ".
               15 VALUE "             ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 5
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "Press any to continue...".
               15 PIC X(1) TO DUMMY-WS.
               15 VALUE "                             ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 4: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
                   20 VALUE "컴컴컴컴컴컴켸".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE " �".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 5: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "�".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
                   20 VALUE "컴컴컴컴컴컴컴컴켸".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 6: Bottom
           10 FILLER LINE + 1 COL 4.
               15 FILLER BACKGROUND-COLOR 0.
                   20 VALUE "                                         ".
                   20 VALUE "                   ".
