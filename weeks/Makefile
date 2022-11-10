input := $(wildcard input/*.inp.md)
output := $(notdir $(input:.inp.md=.out.md ))

all: $(output)

%.out.md: input/%.inp.md Makefile input/links.txt
	cat $< input/links.txt > $@

clean:
	rm *.out.md
