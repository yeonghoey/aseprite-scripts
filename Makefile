SHELL = /bin/bash
.PHONY: sync open

LIBDIR = lib
LIB = $(wildcard $(LIBDIR)/*.lua)
SRCDIR = scripts
SRC = $(wildcard $(SRCDIR)/*.lua)

DSTDIR = $(HOME)/Library/Application\ Support/Aseprite/scripts
DST = $(SRC:$(SRCDIR)%.lua=$(DSTDIR)%.lua)

sync: $(DST)

open:
	open $(DSTDIR)

$(DSTDIR)/%.lua: $(SRCDIR)/%.lua $(LIB) render.py
	python 'render.py' '$<' > '$@'
