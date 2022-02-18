PROGNAME = librarysystem
OBJ_DIR = cobol_obj
SRC_DIR = src
MAIN_SRC =  $(SRC_DIR)/main.cob
COBC_OPTION = -c
SUBPROGRAMS_SRC = $(filter-out $(SRC_DIR)/main.cob, $(wildcard $(SRC_DIR)/*.cob))
SUBPROGRAMS_OBJ = $(SUBPROGRAMS_SRC:src/%.cob=%.o)
SUBPROGRAMS_OBJ_PATH = $(SUBPROGRAMS_OBJ:%=$(OBJ_DIR)/%)

all: main

main: $(MAIN_SRC) $(SUBPROGRAMS_OBJ)
	cobc -x $(MAIN_SRC) $(SUBPROGRAMS_OBJ_PATH) -o $(PROGNAME)
	@echo .
	@echo .
	@echo .
	@echo All done.

$(SUBPROGRAMS_OBJ): %.o: $(SRC_DIR)/%.cob
	cobc $(COBC_OPTION) $< -o $(OBJ_DIR)/$@

clean: 
	rm $(OBJ_DIR)/*.o $(PROGNAME)
	
clean-windows: 
	del /q $(OBJ_DIR)\*.o $(PROGNAME).exe

files: 
	@echo "SUBPROGRAMS_SRC: $(SUBPROGRAMS_SRC)"
	@echo "SUBPROGRAMS_OBJ: $(SUBPROGRAMS_OBJ)"
	@echo "SUBPROGRAMS_OBJ_PATH: $(SUBPROGRAMS_OBJ_PATH)"

#Pull request test
#Merge Test