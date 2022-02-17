OBJ_DIR = cobol_obj
COBC_OPTION = -c
SUBPROGRAMS_SRC = $(filter-out main.cob, $(wildcard *.cob))
SUBPROGRAMS_OBJ = $(SUBPROGRAMS_SRC:%.cob=%.o)
SUBPROGRAMS_OBJ_PATH = $(SUBPROGRAMS_SRC:%.cob=$(OBJ_DIR)/%.o)

all: main

main: main.cob $(SUBPROGRAMS_OBJ)
	cobc -x main.cob $(SUBPROGRAMS_OBJ_PATH) -o librarysystem

$(SUBPROGRAMS_OBJ): %.o: %.cob
	cobc $(COBC_OPTION) $< -o $(OBJ_DIR)/$@

clean: 
	rm cobol_obj/* librarysystem

files: 
	@echo "SUBPROGRAMS_SRC: $(SUBPROGRAMS_SRC)"
	@echo "SUBPROGRAMS_OBJ: $(SUBPROGRAMS_OBJ)"
	@echo "SUBPROGRAMS_OBJ_PATH: $(SUBPROGRAMS_OBJ_PATH)"
