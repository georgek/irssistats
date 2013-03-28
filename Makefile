PRE = /usr/local
BIN = $(PRE)/bin
DAT = $(PRE)/share/irssistats/data
DOC = $(PRE)/share/doc/irssistats
MAN = $(PRE)/share/man/man1
CFLAGS ?= -O2

irssistats:irssistats.c
	gcc $(CFLAGS) -o irssistats irssistats.c

clean:
	rm -f irssistats

install:irssistats
	mkdir -p $(BIN) $(DAT) $(DOC) $(MAN)
	cp -f irssistats $(BIN)
	cp -f data/* $(DAT)
	cp -f COPYING README sample.nickfile sample.configfile irssistats.sgml $(DOC)
	cp -f irssistats.1 $(MAN)

uninstall:
	rm -f $(BIN)/irssistats
	rm -rf $(DAT) $(DOC)
	rm -f $(MAN)/irssistats.1
