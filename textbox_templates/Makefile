toupper = $(subst a,A,$(subst b,B,$(subst c,C,$(subst d,D,$(subst e,E,$(subst f,F,$(subst g,G,$(subst h,H,$(subst i,I,$(subst j,J,$(subst k,K,$(subst l,L,$(subst m,M,$(subst n,N,$(subst o,O,$(subst p,P,$(subst q,Q,$(subst r,R,$(subst s,S,$(subst t,T,$(subst u,U,$(subst v,V,$(subst w,W,$(subst x,X,$(subst y,Y,$(subst z,Z,$1))))))))))))))))))))))))))

OUTPUT_DIR = ../copy
TEXTBOX_TEMPLATES := $(wildcard *.txt)
TEXTBOX_COPYBOOK := $(TEXTBOX_TEMPLATES:%.txt=$(OUTPUT_DIR)/%.cpy)

all: $(TEXTBOX_COPYBOOK)

$(TEXTBOX_COPYBOOK): $(OUTPUT_DIR)/%.cpy : %.txt
	python textbox-gen.py -n $(call toupper,$(subst .txt,,$<)) -c $< -o $@

clean:
	rm $(TEXTBOX_COPYBOOK)

clean-windows:
	del $(subst /,\,$(TEXTBOX_COPYBOOK))

files:
	@echo "$(TEXTBOX_COPYBOOK)"
