toupper = $(subst a,A,$(subst b,B,$(subst c,C,$(subst d,D,$(subst e,E,$(subst f,F,$(subst g,G,$(subst h,H,$(subst i,I,$(subst j,J,$(subst k,K,$(subst l,L,$(subst m,M,$(subst n,N,$(subst o,O,$(subst p,P,$(subst q,Q,$(subst r,R,$(subst s,S,$(subst t,T,$(subst u,U,$(subst v,V,$(subst w,W,$(subst x,X,$(subst y,Y,$(subst z,Z,$1))))))))))))))))))))))))))

PROGNAME = librarysystem.exe
OBJ_DIR = obj
SRC_DIR = src
TEXTBOX_TEMPLATES_DIR = textbox_templates
COPYBOOK_DIR = copy
MAIN_SRC = $(SRC_DIR)/main.cob
COBC_OPTION = -c
TEXTBOX_TEMPLATES := $(wildcard $(TEXTBOX_TEMPLATES_DIR)/*.txt)
TEXTBOX_COPYBOOK := $(TEXTBOX_TEMPLATES:$(TEXTBOX_TEMPLATES_DIR)/%.txt=$(COPYBOOK_DIR)/%.cpy)
SUBPROGRAMS_SRC = $(filter-out $(SRC_DIR)/main.cob, $(wildcard $(SRC_DIR)/*.cob))
SUBPROGRAMS_OBJ = $(SUBPROGRAMS_SRC:$(SRC_DIR)/%.cob=$(OBJ_DIR)/%.o)

all: $(PROGNAME)

$(PROGNAME): $(TEXTBOX_COPYBOOK) $(MAIN_SRC) $(SUBPROGRAMS_OBJ)
	@cobc -x $(MAIN_SRC) $(SUBPROGRAMS_OBJ) -o $(PROGNAME)
	@echo .
	@echo .
	@echo .
	@echo All done.

$(SUBPROGRAMS_OBJ): $(OBJ_DIR)/%.o: $(SRC_DIR)/%.cob
	@cobc $(COBC_OPTION) $< -o $@

$(TEXTBOX_COPYBOOK): $(COPYBOOK_DIR)/%.cpy : $(TEXTBOX_TEMPLATES_DIR)/%.txt
	@python $(TEXTBOX_TEMPLATES_DIR)/textbox-gen.py -n $(call toupper,$(subst $(TEXTBOX_TEMPLATES_DIR)/,,$(subst .txt,,$<))) -c $< -o $@ 2> nul

clean: 
	rm $(OBJ_DIR)/*.o $(PROGNAME)
	rm $(TEXTBOX_COPYBOOK)
	
clean-windows: 
	del /q $(OBJ_DIR)\*.o $(PROGNAME)
	del $(subst /,\,$(TEXTBOX_COPYBOOK))

files: 
	@echo "SUBPROGRAMS_SRC: $(SUBPROGRAMS_SRC)"
	@echo "SUBPROGRAMS_OBJ: $(SUBPROGRAMS_OBJ)"
	@echo "TEXTBOX_COPYBOOK: $(TEXTBOX_COPYBOOK)"
