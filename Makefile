SHELL = /bin/bash

LIBDIR = lib
LIB = $(wildcard $(LIBDIR)/*.lua)
SRCDIR = src
SRC = $(wildcard $(SRCDIR)/*.lua)

SCRIPTSDIR = scripts
SCRIPTS = $(SRC:$(SRCDIR)%.lua=$(SCRIPTSDIR)%.lua)
DSTDIR = $(HOME)/Library/Application\ Support/Aseprite/scripts
DST = $(SRC:$(SRCDIR)%.lua=$(DSTDIR)%.lua)


.PHONY: sync open
.SECONDARY: $(SCRIPTS)


sync: $(DST)

open:
	open $(DSTDIR)

$(SCRIPTSDIR)/%.lua: $(SRCDIR)/%.lua $(LIB) render.py $(SCRIPTSDIR)
	python 'render.py' '$<' > '$@'

$(SCRIPTSDIR):
	mkdir -p 'scripts'

$(DSTDIR)/%.lua: $(SCRIPTSDIR)/%.lua
	cp '$<' '$@'
