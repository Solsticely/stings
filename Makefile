# st - simple terminal
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = st.c x.c boxdraw.c hb.c
OBJ = $(SRC:.c=.o)

all: st

.c.o:
	$(CC) $(STCFLAGS) -c $<

st.o: config.h st.h win.h
x.o: arg.h config.h st.h win.h hb.h
boxdraw.o: config.h st.h boxdraw_data.h
hb.o: st.h

$(OBJ): config.h config.mk

st: $(OBJ)
	$(CC) -o $@ $(OBJ) $(STLDFLAGS)

clean:
	rm -f st $(OBJ) st-$(VERSION).tar.gz

dist: clean
	mkdir -p st-$(VERSION)
	cp -R FAQ LEGACY TODO LICENSE Makefile README config.mk\
		config.def.h st.info st.1 arg.h st.h win.h $(SRC)\
		st-$(VERSION)
	tar -cf - st-$(VERSION) | gzip > st-$(VERSION).tar.gz
	rm -rf st-$(VERSION)

install: st st.desktop
	mkdir -p $(PREFIX)/bin
	cp -f st $(PREFIX)/bin
	chmod 755 $(PREFIX)/bin/st
	mkdir -p $(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < st.1 > $(MANPREFIX)/man1/st.1
	chmod 644 $(MANPREFIX)/man1/st.1
	tic -sx st.info
	@echo Please see the README file regarding the terminfo entry of st.
	mkdir -p $(ICONPREFIX)
	[ -f $(ICONNAME) ] && cp -f $(ICONNAME) $(ICONPREFIX) || :
	mkdir -p $(APPPREFIX)
	sed "s:ICONPATH:$(ICONPREFIX)/$(ICONNAME):g" < st.desktop | \
	sed "s:EXECPATH:$(PREFIX)/bin/st:g" > $(APPPREFIX)/st.desktop

uninstall:
	rm -f $(PREFIX)/bin/st
	rm -f $(APPPREFIX)/st.desktop
	rm -f $(MANPREFIX)/man1/st.1
	rm -f $(ICONPREFIX)/$(ICONNAME)

.PHONY: all clean dist install uninstall
