       01 ENTER-PASSWORD-SCREEN.
       05 FILLER AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           10 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.

      *    Part 1: Top
           10 FILLER LINE 2 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "�".
               15 VALUE " Login as admin ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "��������������".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".

      *    Part 2: Top
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "���������������������������".
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
               15 VALUE "Enter password: ".
               15 PIC X(10) TO PASSWORD-WS SECURE.
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
                   20 VALUE "���������������������������".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE " �".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 5: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "�".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�������������������������������".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 6: Bottom
           10 FILLER LINE + 1 COL 4.
               15 FILLER BACKGROUND-COLOR 0.
                   20 VALUE "                                ".
