NVIM ?= nvim

WORDLIST := en.utf-8.add
SPELLFILE := $(WORDLIST).spl

.PHONY: all clean

all: $(SPELLFILE)

$(SPELLFILE): $(WORDLIST)
	$(NVIM) --clean --headless -u NONE \
		-c 'mkspell! $(SPELLFILE) $(WORDLIST)' \
		-c 'qa!'

clean:
	rm -f $(SPELLFILE)
