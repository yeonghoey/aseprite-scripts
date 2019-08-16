SHELL = /bin/bash
.PHONY: sync open

SRCDIR = scripts
SRC = $(wildcard $(SRCDIR)/*.lua)

DSTDIR = $(HOME)/Library/Application\ Support/Aseprite/scripts
DST = $(SRC:$(SRCDIR)%.lua=$(DSTDIR)%.lua)

sync: $(DST)

open:
	open $(DSTDIR)

$(DSTDIR)/%.lua: $(SRCDIR)/%.lua
	cp '$<' '$@'
