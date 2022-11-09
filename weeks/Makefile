input := $(wildcard *.inp.md)
output := $(input:.inp.md=.out.md )

all: $(output)

%.out.md: %.inp.md Makefile meta.yml
	echo $(output)
	pandoc --to=markdown --metadata-file=meta.yml $< -o $@