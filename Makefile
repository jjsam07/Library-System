PROGNAME = librarysystem.exe
OBJ_DIR = obj
SRC_DIR = src
MAIN_SRC =  $(SRC_DIR)/main.cob
COBC_OPTION = -c
SUBPROGRAMS_SRC = $(filter-out $(SRC_DIR)/main.cob, $(wildcard $(SRC_DIR)/*.cob))
SUBPROGRAMS_OBJ = $(SUBPROGRAMS_SRC:$(SRC_DIR)/%.cob=$(OBJ_DIR)/%.o)

all: $(PROGNAME)

$(PROGNAME): $(MAIN_SRC) $(SUBPROGRAMS_OBJ)
	cobc -x $(MAIN_SRC) $(SUBPROGRAMS_OBJ) -o $(PROGNAME)
	@echo .
	@echo .
	@echo .
	@echo All done.

$(SUBPROGRAMS_OBJ): $(OBJ_DIR)/%.o: $(SRC_DIR)/%.cob
	cobc $(COBC_OPTION) $< -o $@

clean: 
	rm $(OBJ_DIR)/*.o $(PROGNAME)
	
clean-windows: 
	del /q $(OBJ_DIR)\*.o $(PROGNAME)

files: 
	@echo "SUBPROGRAMS_SRC: $(SUBPROGRAMS_SRC)"
	@echo "SUBPROGRAMS_OBJ: $(SUBPROGRAMS_OBJ)"
