NAME:=xdbar
VERSION:=0.3.5
BUILD:=.build
ODIR:=$(BUILD)/cache
IDIR:=src
BIN:=$(BUILD)/bin/$(NAME)
BACKEND:=$(NAME)/backend
PREFIX:=/usr/local
BINPREFIX:=$(PREFIX)/bin

PKGS=x11 xft
PLUGINS=
SRC=$(IDIR)/$(NAME).c                        \
    $(IDIR)/$(NAME)/core.c                   \
    $(IDIR)/$(NAME)/core/blocks.c            \
    $(PLUGINS:%=$(IDIR)/$(NAME)/plugins/%.c)

OBJS=$(SRC:$(IDIR)/%.c=$(ODIR)/%.o)
ifneq ($(filter luaconfig,$(PLUGINS)),)
	PKGS+= lua
endif

FLAGS:=-Wall -Wextra -Wvla -pedantic -I$(IDIR) -O3 -ggdb -std=c99
PREPROC:=-D_GNU_SOURCE                       \
         -DNAME='"$(NAME)"'                  \
         -DVERSION='"$(VERSION)"'            \
         $(PLUGINS:%=-D__ENABLE_PLUGIN__%__)

# In case 'pkg-config' is not installed, update LDFLAGS and CFLAGS accordingly.
override CFLAGS+= $(FLAGS) $(PREPROC) $(shell pkg-config --cflags $(PKGS))
LDFLAGS=-lpthread $(shell pkg-config --libs $(PKGS))
