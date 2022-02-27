import sys

MAX_CHARACTERS = 41
VERTICAL_LINE = "\xb3"
HORIZONTAL_LINE = "\xc4"
UPPER_LEFT_CORNER = "\xda"
UPPER_RIGHT_CORNER = "\xbf"
LOWER_LEFT_CORNER = "\xc0"
LOWER_RIGHT_CORNER = "\xd9"

OUTPUT_FILE = "\0"
TEXTBOX_MARGIN_LEFT = 0
TEXTBOX_MARGIN_RIGHT = 0
TEXTBOX_MARGIN_TOP = 0
TEXTBOX_MARGIN_BOTTOM = 0
TEXTBOX_TITLE = "\0"
TEXTBOX_CONTENT = "\0"
TEXTBOX_NAME = "\0"
LONGEST_LINE = 0
LINES = 0
TEMP = 0
IDX = 0
LEN = 0
MULT = 0

def textbox():
	global LONGEST_LINE
	global LINES
	global TEMP
	global IDX
	global LEN
	global MULT
	
	for line in TEXTBOX_CONTENT:
		print(line)
	
	OUTPUT_FILE.write("       01 {} AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.\n".format(TEXTBOX_NAME))
	OUTPUT_FILE.write("           05 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.\n\n")
	
	LONGEST_LINE = len(max(TEXTBOX_CONTENT, key=len))
	LINES = len(TEXTBOX_CONTENT)
	
#   --------------------- Part 1: Top ---------------------

	OUTPUT_FILE.write("      *    Part 1: Top\n")
	OUTPUT_FILE.write("           05 FILLER LINE 10 COL 10.\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	
	if TEXTBOX_TITLE == "\0":
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+4
		TEMP = UPPER_LEFT_CORNER+(HORIZONTAL_LINE*MULT)
		LEN = len(TEMP)
		while(IDX < LEN):
			OUTPUT_FILE.write("                   15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
	else:
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+2-len(TEXTBOX_TITLE)
		
		OUTPUT_FILE.write("                   15 VALUE \"\xda\".\n")
		OUTPUT_FILE.write("               10 VALUE \" {} \".\n".format(TEXTBOX_TITLE))
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		
		TEMP = (HORIZONTAL_LINE*MULT)
		LEN = len(TEMP)
		while(IDX < LEN):
			OUTPUT_FILE.write("                   15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
	
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   15 VALUE \"\xbf\".\n\n")

#   --------------------- Part 2: Top ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
	TEMP = UPPER_LEFT_CORNER+(HORIZONTAL_LINE*MULT)
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 2: Top\n")
	OUTPUT_FILE.write("           05 FILLER LINE + 1 COL 10.\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   15 VALUE \"\xbf \".\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   15 VALUE \"\xb3\".\n")
	OUTPUT_FILE.write("               10 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
	
#   --------------------- Part 3: Content ---------------------
	
	COUNTER = 1
	OUTPUT_FILE.write("      *    Part 3: Content\n")
	for i in range(0, TEXTBOX_MARGIN_TOP):
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
		TEMP = " "*MULT
		LEN = len(TEMP)
		
		OUTPUT_FILE.write("      *    Content: Top margin {}\n".format(COUNTER))
		OUTPUT_FILE.write("           05 FILLER LINE + 1 COL 10.\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3\".\n")
		while(IDX < LEN):
			OUTPUT_FILE.write("               10 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3\".\n")
		OUTPUT_FILE.write("               10 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
		COUNTER += 1
		
	COUNTER = 1
	for line in TEXTBOX_CONTENT:
		IDX = 0
		PADDING = LONGEST_LINE-len(line)
		TEMP = (" "*TEXTBOX_MARGIN_LEFT)+line+(" "*(TEXTBOX_MARGIN_RIGHT+PADDING))
		LEN = len(TEMP)
	
		OUTPUT_FILE.write("      *    Content: Line {}\n".format(COUNTER))
		OUTPUT_FILE.write("           05 FILLER LINE + 1 COL 10.\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3\".\n")
		while(IDX < LEN):
			OUTPUT_FILE.write("               10 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3\".\n")
		OUTPUT_FILE.write("               10 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
		COUNTER += 1
	
	COUNTER = 1
	for i in range(0, TEXTBOX_MARGIN_BOTTOM):
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
		TEMP = " "*MULT
		LEN = len(TEMP)
		
		OUTPUT_FILE.write("      *    Content: Bottom margin {}\n".format(COUNTER))
		OUTPUT_FILE.write("           05 FILLER LINE + 1 COL 10.\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3\".\n")
		while(IDX < LEN):
			OUTPUT_FILE.write("               10 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   15 VALUE \"\xb3\".\n")
		OUTPUT_FILE.write("               10 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
		COUNTER += 1
	
#   --------------------- Part 4: Bottom ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
	TEMP = (HORIZONTAL_LINE*MULT)+LOWER_RIGHT_CORNER
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 4: Bottom\n")
	OUTPUT_FILE.write("           05 FILLER LINE + 1 COL 10.\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   15 VALUE \"\xb3 \".\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   15 VALUE \"\xc0\".\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   15 VALUE \" \xb3\".\n")
	OUTPUT_FILE.write("               10 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
	
#   --------------------- Part 5: Bottom ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+4
	TEMP = (HORIZONTAL_LINE*MULT)+LOWER_RIGHT_CORNER
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 5: Bottom\n")
	OUTPUT_FILE.write("           05 FILLER LINE + 1 COL 10.\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   15 VALUE \"\xc0\".\n")
	OUTPUT_FILE.write("               10 FILLER FOREGROUND-COLOR 0.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	OUTPUT_FILE.write("               10 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
	
#   --------------------- Part 6: Bottom ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+6
	TEMP = " "*MULT
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 6: Bottom\n")
	OUTPUT_FILE.write("           05 FILLER LINE + 1 COL 12.\n")
	OUTPUT_FILE.write("               10 FILLER BACKGROUND-COLOR 0.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	
	OUTPUT_FILE.close()

def main():
	global OUTPUT_FILE
	global TEXTBOX_MARGIN_LEFT
	global TEXTBOX_MARGIN_RIGHT
	global TEXTBOX_MARGIN_TOP
	global TEXTBOX_MARGIN_BOTTOM
	global TEXTBOX_TITLE
	global TEXTBOX_CONTENT
	global TEXTBOX_NAME
	count = 1
	
	for i in sys.argv:
		if i == '-ml':
			TEXTBOX_MARGIN_LEFT = int(sys.argv[count])
			count += 1
			continue
		if i == '-mr':
			TEXTBOX_MARGIN_RIGHT = int(sys.argv[count])
			count += 1
			continue
		if (i == '-mt'):
			TEXTBOX_MARGIN_TOP = int(sys.argv[count])
			count += 1
			continue
		if (i == '-mb'):
			TEXTBOX_MARGIN_BOTTOM = int(sys.argv[count])
			count += 1
			continue
		if (i == '-n'):
			TEXTBOX_NAME = sys.argv[count]
			count += 1
			continue
		if (i == '-t'):
			TEXTBOX_TITLE = sys.argv[count]
			count += 1
			continue
		if (i == '-c'):
			fin = open(sys.argv[count], "rb")
			TEXTBOX_CONTENT = fin.read().splitlines()
			fin.close()
			count += 1
			continue
		if (i == '-o'):
			OUTPUT_FILE = open(sys.argv[count], "wb")
			count += 1
			error = 0
			continue
		count += 1
	
	if TEXTBOX_NAME == "\0":
		print "Bruh, give your textbox a name."
		return 0
	
	if TEXTBOX_CONTENT == "\0":
		print "Bruh, there are no contents to work with."
		return 0
	
	if OUTPUT_FILE == "\0":
		print "Bruh, no output file."
		return 0
		
	textbox()
		
if __name__ == '__main__':
	main()