SHELL = /bin/bash

LIBDIR = lib
LIB = $(wildcard $(LIBDIR)/*.lua)
SRCDIR = scripts
SRC = $(wildcard $(SRCDIR)/*.lua)

RENDIR = rendered
REN = $(SRC:$(RENDIR)%.lua=$(RENDIR)%.lua)

DSTDIR = $(HOME)/Library/Application\ Support/Aseprite/scripts
DST = $(SRC:$(SRCDIR)%.lua=$(DSTDIR)%.lua)


.PHONY: sync open
.SECONDARY: $(REN)


sync: $(DST)

open:
	open $(DSTDIR)

$(RENDIR)/%.lua: $(SRCDIR)/%.lua $(LIB) render.py
	python 'render.py' '$<' > '$@'

$(DSTDIR)/%.lua: $(RENDIR)/%.lua
	cp '$<' '$@'
