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
#LONGEST_LINE = 0
#TEMP = 0
#IDX = 0
#LEN = 0
#MULT = 0

def line_len(line):
#	print "DEBUG: line_len: \"" + line + "\""
	temp_len = 0
	LINE_LEN = len(line)
	SUBST_END = 0
	STR_START = 0
	while(SUBST_END < LINE_LEN):
		if "${input}" in line[SUBST_END:].lower():
			SUBST_START = line[SUBST_END:].lower().index("${input}")+SUBST_END
			SUBST_IDX = SUBST_START+8
			STR_START = SUBST_END
			
#			print "\"" + line[SUBST_END:] + "\""
#			print "SUBST_IDX = %d" % SUBST_IDX
			if line[SUBST_IDX] != "{":
				print "Bruh, I don't know what type your input is."
				exit(1)
			else:
				SUBST_IDX += 1
				if line.find(":", SUBST_IDX, SUBST_IDX+3) != -1:
					SUBST_END = line.find(":", SUBST_IDX, SUBST_IDX+3)
					SUBST_IDX = SUBST_END+1
					SUBST_END = line.find("}", SUBST_IDX)
					if SUBST_END != -1:
						temp_len += int(line[SUBST_IDX:SUBST_END])
						SUBST_IDX = SUBST_END+1
					else:
						print "DEBUG: \"" + line[SUBST_IDX:] + "\""
						print "SUBST_IDX = %d" % SUBST_IDX
						print "Found \':\' but missing \'}\'"
						print "Bruh, please follow the format \'${input}{TT[:N]}\'"
						print "where:"
						print "TT = type"
						print "N = Number of characters or digits"
						exit(1)
				elif line.find("}", SUBST_IDX, SUBST_IDX+3) != -1:
					SUBST_END = line.find("}", SUBST_IDX, SUBST_IDX+3)
					SUBST_IDX = SUBST_END+1
					temp_len += 1
				else:
					print "DEBUG: \"" + line[SUBST_IDX:] + "\""
					print "SUBST_IDX = %d" % SUBST_IDX
					print "Expected \'}\': not found."
					print "Bruh, please follow the format \'${input}{TT[:N]}\'"
					print "where:"
					print " TT = type"
					print " N = Number of characters or digits (optional)"
					exit(1)
				if line[SUBST_IDX] != "{":
					print "Bruh, provide a variable to store your input."
					exit(1)
				else:
					SUBST_IDX += 1
					if line.find("}", SUBST_IDX) != -1: 
						SUBST_END = line.find("}", SUBST_IDX)
					else:
						print "Bruh, please follow the format \'${input}{TT[:N]}{VARNAME}\'"
						print "where:"
						print " TT = type"
						print " N = Number of characters or digits (optional)"
						print " VARNAME = name of variable to store input."
						exit(1)
			
			SUBST_END += 1
			TEMP = line[STR_START:SUBST_START]
			temp_len += len(TEMP)
		elif "${output}" in line[SUBST_END:].lower():
			SUBST_START = line[SUBST_END:].lower().index("${output}")+SUBST_END
			SUBST_IDX = SUBST_START+9
			STR_START = SUBST_END
			
#			print "\"" + line[SUBST_END:] + "\""
#			print "SUBST_IDX = %d" % SUBST_IDX
			if line[SUBST_IDX] != "{":
				print "Bruh, I don't know what type your output is."
				exit(1)
			else:
				SUBST_IDX += 1
				if line.find(":", SUBST_IDX, SUBST_IDX+3) != -1:
					SUBST_END = line.find(":", SUBST_IDX, SUBST_IDX+3)
					SUBST_IDX = SUBST_END+1
					SUBST_END = line.find("}", SUBST_IDX)
					if SUBST_END != -1:
						temp_len += int(line[SUBST_IDX:SUBST_END])
						SUBST_IDX = SUBST_END+1
					else:
						print "DEBUG: \"" + line[SUBST_IDX:] + "\""
						print "SUBST_IDX = %d" % SUBST_IDX
						print "Found \':\' but missing \'}\'"
						print "Bruh, please follow the format \'${output}{TT[:N]}\'"
						print "where:"
						print "TT = type"
						print "N = Number of characters or digits"
						exit(1)
				elif line.find("}", SUBST_IDX, SUBST_IDX+3) != -1:
					SUBST_END = line.find("}", SUBST_IDX, SUBST_IDX+3)
					SUBST_IDX = SUBST_END+1
					temp_len += 1
				else:
					print "DEBUG: \"" + line[SUBST_IDX:] + "\""
					print "SUBST_IDX = %d" % SUBST_IDX
					print "Expected \'}\': not found."
					print "Bruh, please follow the format \'${output}{TT[:N]}\'"
					print "where:"
					print " TT = type"
					print " N = Number of characters or digits (optional)"
					exit(1)
				if line[SUBST_IDX] != "{":
					print "Bruh, provide a variable to be displayed."
					exit(1)
				else:
					SUBST_IDX += 1
					if line.find("}", SUBST_IDX) != -1: 
						SUBST_END = line.find("}", SUBST_IDX)
					else:
						print "Bruh, please follow the format \'${output}{TT[:N]}{VARNAME}\'"
						print "where:"
						print " TT = type"
						print " N = Number of characters or digits (optional)"
						print " VARNAME = name of variable to be displayed."
						exit(1)
			
			SUBST_END += 1
			TEMP = line[STR_START:SUBST_START]
			temp_len += len(TEMP)
		else:
			TEMP = line[STR_START:]
			temp_len += len(TEMP)
			break
			
	return temp_len

def longest_line(lines):
#	print "\n ------------ Line length ------------"
	longest = 0
	temp_len = 0
	for line in lines:
		if "${title}" in line:
			continue
		if "${marginleft}" in line:
			continue
		if "${marginright}" in line:
			continue
		if "${margintop}" in line:
			continue
		if "${marginbottom}" in line:
			continue
		temp_len = line_len(line)
		if temp_len > longest:
			longest = temp_len
#		print "\'" + line + "\'" + " :-> %d" % temp_len
		temp_len = 0
#	print "longest = %d" % longest
	return longest

def textbox():
	global TEXTBOX_MARGIN_LEFT
	global TEXTBOX_MARGIN_RIGHT
	global TEXTBOX_MARGIN_TOP
	global TEXTBOX_MARGIN_BOTTOM
	global TEXTBOX_TITLE
	
	for line in TEXTBOX_CONTENT:
		if "${title}" in line:
			if line[8] != "{":
				print "Bruh, please follow the format \'${title}{X}\'"
				print "where:"
				print " X = title of your choice"
				exit(1)
			else:
				SUBST_END = line.find("}", 9)
				if SUBST_END != -1:
					TEXTBOX_TITLE = line[9:SUBST_END]
				else:
					print "Bruh, please follow the format \'${title}{X}\'"
					print "where:"
					print " X = title of your choice"
					exit(1)
			continue
		if "${marginleft}" in line:
			if line[13] != "{":
				print "Bruh, please follow the format \'${marginleft}{X}\'"
				print "where:"
				print " X = your margin"
				exit(1)
			else:
				SUBST_END = line.find("}", 14)
				if SUBST_END != -1:
					TEXTBOX_MARGIN_LEFT = int(line[14:SUBST_END])
				else:
					print "Bruh, please follow the format \'${marginleft}{X}\'"
					print "where:"
					print " X = your margin"
					exit(1)
			continue
		if "${marginright}" in line:
			if line[14] != "{":
				print "Bruh, please follow the format \'${marginright}{X}\'"
				print "where:"
				print " X = your margin"
				exit(1)
			else:
				SUBST_END = line.find("}", 15)
				if SUBST_END != -1:
					TEXTBOX_MARGIN_RIGHT = int(line[15:SUBST_END])
				else:
					print "Bruh, please follow the format \'${marginright}{X}\'"
					print "where:"
					print " X = your margin"
					exit(1)
			continue
		if "${margintop}" in line:
			if line[12] != "{":
				print "Bruh, please follow the format \'${margintop}{X}\'"
				print "where:"
				print " X = your margin"
				exit(1)
			else:
				SUBST_END = line.find("}", 13)
				if SUBST_END != -1:
					TEXTBOX_MARGIN_TOP = int(line[13:SUBST_END])
				else:
					print "Bruh, please follow the format \'${margintop}{X}\'"
					print "where:"
					print " X = your margin"
					exit(1)
			continue
		if "${marginbottom}" in line:
			if line[15] != "{":
				print "Bruh, please follow the format \'${marginbottom}{X}\'"
				print "where:"
				print " X = your margin"
				exit(1)
			else:
				SUBST_END = line.find("}", 16)
				if SUBST_END != -1:
					TEXTBOX_MARGIN_BOTTOM = int(line[16:SUBST_END])
				else:
					print "Bruh, please follow the format \'${marginbottom}{X}\'"
					print "where:"
					print " X = your margin"
					exit(1)
			continue
	
	OUTPUT_FILE.write("       01 {}.\n".format(TEXTBOX_NAME))
	OUTPUT_FILE.write("       05 FILLER AUTO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.\n".format(TEXTBOX_NAME))
	OUTPUT_FILE.write("           10 BLANK SCREEN BACKGROUND-COLOR 1 FOREGROUND-COLOR 0.\n\n")
	
	LONGEST_LINE = longest_line(TEXTBOX_CONTENT)
	
#   --------------------- Part 1: Top ---------------------

	OUTPUT_FILE.write("      *    Part 1: Top\n")
	OUTPUT_FILE.write("           10 FILLER LINE 2 COL 2.\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	
	if TEXTBOX_TITLE == "\0":
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+4
		TEMP = UPPER_LEFT_CORNER+(HORIZONTAL_LINE*MULT)
		LEN = len(TEMP)
		while(IDX < LEN):
			OUTPUT_FILE.write("                   20 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
	else:
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+2-len(TEXTBOX_TITLE)
		
		OUTPUT_FILE.write("                   20 VALUE \"\xda\".\n")
		OUTPUT_FILE.write("               15 VALUE \" {} \".\n".format(TEXTBOX_TITLE))
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		
		TEMP = (HORIZONTAL_LINE*MULT)
		LEN = len(TEMP)
		while(IDX < LEN):
			OUTPUT_FILE.write("                   20 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
	
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   20 VALUE \"\xbf\".\n\n")

#   --------------------- Part 2: Top ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
	TEMP = UPPER_LEFT_CORNER+(HORIZONTAL_LINE*MULT)
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 2: Top\n")
	OUTPUT_FILE.write("           10 FILLER LINE + 1 COL 2.\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   20 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   20 VALUE \"\xbf \".\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   20 VALUE \"\xb3\".\n")
	OUTPUT_FILE.write("               15 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
	
#   --------------------- Part 3: Content ---------------------
	
	COUNTER = 1
	OUTPUT_FILE.write("      *    Part 3: Content\n")
	for i in range(0, TEXTBOX_MARGIN_TOP):
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
		TEMP = " "*MULT
		LEN = len(TEMP)
		
		OUTPUT_FILE.write("      *    Content: Top margin {}\n".format(COUNTER))
		OUTPUT_FILE.write("           10 FILLER LINE + 1 COL 2.\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3\".\n")
		while(IDX < LEN):
			OUTPUT_FILE.write("               15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3\".\n")
		OUTPUT_FILE.write("               15 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
		COUNTER += 1
		
	COUNTER = 1
	for line in TEXTBOX_CONTENT:
		if "${title}" in line:
			continue
		if "${marginleft}" in line:
			continue
		if "${marginright}" in line:
			continue
		if "${margintop}" in line:
			continue
		if "${marginbottom}" in line:
			continue
			
		IDX = 0
		PADDING = LONGEST_LINE-line_len(line)
		LINE_LEN = len(line)
		
		OUTPUT_FILE.write("      *    Content: Line {}\n".format(COUNTER))
		OUTPUT_FILE.write("           10 FILLER LINE + 1 COL 2.\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3\".\n")
		
		IDX = 0
		TEMP = " "*TEXTBOX_MARGIN_LEFT
		LEN = len(TEMP)
		while(IDX < LEN):
			OUTPUT_FILE.write("               15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
		
		SUBST_END = 0
		STR_START = 0
		while(SUBST_END <= LINE_LEN):
#			print "DEBUF: current line: " + line
#			print "DEBUG: SUBST_END: %d" % SUBST_END
			if "${input}" in line[SUBST_END:].lower():
				
				SUBST_START = line[SUBST_END:].lower().index("${input}")+SUBST_END
				SUBST_IDX = SUBST_START+8
				STR_START = SUBST_END
				INPUT_TYPE = "\0"
				INPUT_LENGTH = "1"
				INPUT_VARNAME = "\0"
				
				if line[SUBST_IDX] != "{":
					print "Bruh, I don't know what type your input is."
					exit(1)
				else:
					SUBST_IDX += 1
					if line.find(":", SUBST_IDX, SUBST_IDX+3) != -1:
						SUBST_END = line.find(":", SUBST_IDX, SUBST_IDX+3)
						INPUT_TYPE = line[SUBST_IDX:SUBST_END]
						SUBST_IDX = SUBST_END+1
						SUBST_END = line.find("}", SUBST_IDX)
						if SUBST_END != -1:
							INPUT_LENGTH = line[SUBST_IDX:SUBST_END]
							SUBST_IDX = SUBST_END+1
						else:
							print "Bruh, please follow the format \'${input}{TT[:N]}\'"
							print "where:"
							print "TT = type"
							print "N = Number of characters or digits"
							exit(1)
					elif line.find("}", SUBST_IDX, SUBST_IDX+3) != -1:
						SUBST_END = line.find("}", SUBST_IDX, SUBST_IDX+3)
						INPUT_TYPE = line[SUBST_IDX:SUBST_END]
						SUBST_IDX = SUBST_END+1
					else:
						print "Bruh, please follow the format \'${input}{TT[:N]}\'"
						print "where:"
						print " TT = type"
						print " N = Number of characters or digits (optional)"
						exit(1)
					if line[SUBST_IDX] != "{":
						print "Bruh, provide a variable to store your input."
						exit(1)
					else:
						SUBST_IDX += 1
						if line.find("}", SUBST_IDX) != -1: 
							SUBST_END = line.find("}", SUBST_IDX)
							INPUT_VARNAME = line[SUBST_IDX:SUBST_END]
						else:
							print "Bruh, please follow the format \'${input}{TT[:N]}{VARNAME}\'"
							print "where:"
							print " TT = type"
							print " N = Number of characters or digits (optional)"
							print " VARNAME = name of variable to store input."
							exit(1)
				
				SUBST_END += 1
				IDX = 0
				TEMP = line[STR_START:SUBST_START]
#				print "DEBUG: if-case: STR_START: %d" % STR_START
#				print "DEBUG: if-case: SUBST_START: %d" % SUBST_START
				LEN = len(TEMP)
#				print "DEBUF: if-case: current line: \"" + TEMP + "\""
				while(IDX < LEN):
					OUTPUT_FILE.write("               15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
					IDX += MAX_CHARACTERS
				OUTPUT_FILE.write("               15 PIC {}({}) TO {}.\n".format(INPUT_TYPE, INPUT_LENGTH, INPUT_VARNAME))
			elif "${output}" in line[SUBST_END:].lower():
				
				SUBST_START = line[SUBST_END:].lower().index("${output}")+SUBST_END
				SUBST_IDX = SUBST_START+9
				STR_START = SUBST_END
				OUTPUT_TYPE = "\0"
				OUTPUT_LENGTH = "1"
				OUTPUT_VARNAME = "\0"
				
				if line[SUBST_IDX] != "{":
					print "Bruh, I don't know what type your output is."
					exit(1)
				else:
					SUBST_IDX += 1
					if line.find(":", SUBST_IDX, SUBST_IDX+3) != -1:
						SUBST_END = line.find(":", SUBST_IDX, SUBST_IDX+3)
						OUTPUT_TYPE = line[SUBST_IDX:SUBST_END]
						SUBST_IDX = SUBST_END+1
						SUBST_END = line.find("}", SUBST_IDX)
						if SUBST_END != -1:
							OUTPUT_LENGTH = line[SUBST_IDX:SUBST_END]
							SUBST_IDX = SUBST_END+1
						else:
							print "Bruh, please follow the format \'${output}{TT[:N]}\'"
							print "where:"
							print "TT = type"
							print "N = Number of characters or digits"
							exit(1)
					elif line.find("}", SUBST_IDX, SUBST_IDX+3) != -1:
						SUBST_END = line.find("}", SUBST_IDX, SUBST_IDX+3)
						OUTPUT_TYPE = line[SUBST_IDX:SUBST_END]
						SUBST_IDX = SUBST_END+1
					else:
						print "Bruh, please follow the format \'${output}{TT[:N]}\'"
						print "where:"
						print " TT = type"
						print " N = Number of characters or digits (optional)"
						exit(1)
					if line[SUBST_IDX] != "{":
						print "Bruh, provide a variable to be displayed."
						exit(1)
					else:
						SUBST_IDX += 1
						if line.find("}", SUBST_IDX) != -1: 
							SUBST_END = line.find("}", SUBST_IDX)
							OUTPUT_VARNAME = line[SUBST_IDX:SUBST_END]
						else:
							print "Bruh, please follow the format \'${output}{TT[:N]}{VARNAME}\'"
							print "where:"
							print " TT = type"
							print " N = Number of characters or digits (optional)"
							print " VARNAME = name of variable to be displayed."
							exit(1)
				
				SUBST_END += 1
				IDX = 0
				TEMP = line[STR_START:SUBST_START]
#				print "DEBUG: if-case: STR_START: %d" % STR_START
#				print "DEBUG: if-case: SUBST_START: %d" % SUBST_START
				LEN = len(TEMP)
#				print "DEBUF: if-case: current line: \"" + TEMP + "\""
				while(IDX < LEN):
					OUTPUT_FILE.write("               15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
					IDX += MAX_CHARACTERS
				OUTPUT_FILE.write("               15 PIC {}({}) FROM {}.\n".format(OUTPUT_TYPE, OUTPUT_LENGTH, OUTPUT_VARNAME))
			else:
				IDX = 0
				if len(line) == 0:
					TEMP = " "*PADDING
				else:
					TEMP = line[SUBST_END:]+(" "*PADDING)
				LEN = len(TEMP)
#				print "DEBUF: else-case: current line: \"" + TEMP + "\""
				while(IDX < LEN):
					OUTPUT_FILE.write("               15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
					IDX += MAX_CHARACTERS
				break
		
		IDX = 0
		TEMP = " "*TEXTBOX_MARGIN_RIGHT
		LEN = len(TEMP)
		while(IDX < LEN):
			OUTPUT_FILE.write("               15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
		
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3\".\n")
		OUTPUT_FILE.write("               15 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
		COUNTER += 1
	
	COUNTER = 1
	for i in range(0, TEXTBOX_MARGIN_BOTTOM):
		IDX = 0
		MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
		TEMP = " "*MULT
		LEN = len(TEMP)
		
		OUTPUT_FILE.write("      *    Content: Bottom margin {}\n".format(COUNTER))
		OUTPUT_FILE.write("           10 FILLER LINE + 1 COL 2.\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3\".\n")
		while(IDX < LEN):
			OUTPUT_FILE.write("               15 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
			IDX += MAX_CHARACTERS
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
		OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
		OUTPUT_FILE.write("                   20 VALUE \"\xb3\".\n")
		OUTPUT_FILE.write("               15 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
		COUNTER += 1
	
#   --------------------- Part 4: Bottom ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT
	TEMP = (HORIZONTAL_LINE*MULT)+LOWER_RIGHT_CORNER
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 4: Bottom\n")
	OUTPUT_FILE.write("           10 FILLER LINE + 1 COL 2.\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   20 VALUE \"\xb3 \".\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   20 VALUE \"\xc0\".\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   20 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
	OUTPUT_FILE.write("                   20 VALUE \" \xb3\".\n")
	OUTPUT_FILE.write("               15 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
	
#   --------------------- Part 5: Bottom ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+4
	TEMP = (HORIZONTAL_LINE*MULT)+LOWER_RIGHT_CORNER
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 5: Bottom\n")
	OUTPUT_FILE.write("           10 FILLER LINE + 1 COL 2.\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 7 HIGHLIGHT.\n")
	OUTPUT_FILE.write("                   20 VALUE \"\xc0\".\n")
	OUTPUT_FILE.write("               15 FILLER FOREGROUND-COLOR 0.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   20 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	OUTPUT_FILE.write("               15 VALUE \"  \" BACKGROUND-COLOR 0.\n\n")
	
#   --------------------- Part 6: Bottom ---------------------
	
	IDX = 0
	MULT = LONGEST_LINE+TEXTBOX_MARGIN_LEFT+TEXTBOX_MARGIN_RIGHT+6
	TEMP = " "*MULT
	LEN = len(TEMP)
	
	OUTPUT_FILE.write("      *    Part 6: Bottom\n")
	OUTPUT_FILE.write("           10 FILLER LINE + 1 COL 4.\n")
	OUTPUT_FILE.write("               15 FILLER BACKGROUND-COLOR 0.\n")
	while(IDX < LEN):
		OUTPUT_FILE.write("                   20 VALUE \"{}\".\n".format(TEMP[IDX:IDX+MAX_CHARACTERS]))
		IDX += MAX_CHARACTERS
	
	OUTPUT_FILE.close()

def main():
	global OUTPUT_FILE
	global TEXTBOX_MARGIN_LEFT
	global TEXTBOX_MARGIN_RIGHT
	global TEXTBOX_MARGIN_TOP
	global TEXTBOX_MARGIN_BOTTOM
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
#	longest_line(TEXTBOX_CONTENT)
		
if __name__ == '__main__':
 	main()
#	line_len("${input}{9}")