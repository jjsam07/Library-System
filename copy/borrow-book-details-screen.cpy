       01 BORROW-BOOK-DETAILS-SCREEN.
       05 FILLER AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           10 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.

      *    Part 1: Top
           10 FILLER LINE 2 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
                   20 VALUE "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".

      *    Part 2: Top
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
                   20 VALUE "컴컴컴컴컴컴컴컴컴컴컴컴컴�".
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
               15 VALUE "Book ID:         ".
               15 PIC 9(10) FROM BOOK-ID-WS.
               15 VALUE "                                        ".
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
               15 VALUE "Name:            ".
               15 PIC X(50) FROM BOOKNAME-WS.
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
               15 VALUE "Author:          ".
               15 PIC X(50) FROM AUTHORNAME-WS.
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
               15 VALUE "Student:         ".
               15 PIC X(50) FROM STUDENTNAME-WS.
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
               15 VALUE "Student address: ".
               15 PIC X(50) FROM STUDENTADDR-WS.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 6
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "Date issued:     ".
               15 PIC 9(2) FROM DD-WS.
               15 VALUE "/".
               15 PIC 9(2) FROM MM-WS.
               15 VALUE "/".
               15 PIC 9(4) FROM YYYY-WS.
               15 VALUE "                                        ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 7
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "Date Borrowed:   ".
               15 PIC 9(2) FROM BDD-WS.
               15 VALUE "/".
               15 PIC 9(2) FROM BMM-WS.
               15 VALUE "/".
               15 PIC 9(4) FROM BYYYY-WS.
               15 VALUE "                                        ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 8
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "                                         ".
               15 VALUE "                          ".
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Content: Line 9
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "� ".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "�".
               15 VALUE "Press any to continue...".
               15 PIC X(1) TO DUMMY-WS.
               15 VALUE "                                         ".
               15 VALUE " ".
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
                   20 VALUE "컴컴컴컴컴컴컴컴컴컴컴컴컴�".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE " �".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 5: Bottom
           10 FILLER LINE + 1 COL 2.
               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.
                   20 VALUE "�".
               15 FILLER FOREGROUND-COLOR 0.
                   20 VALUE "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
                   20 VALUE "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�".
               15 VALUE "  " BACKGROUND-COLOR 0.

      *    Part 6: Bottom
           10 FILLER LINE + 1 COL 4.
               15 FILLER BACKGROUND-COLOR 0.
                   20 VALUE "                                         ".
                   20 VALUE "                                ".
