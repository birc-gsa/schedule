input := $(wildcard *.inp.md)
output := $(input:.inp.md=.out.md )

all: $(output)

%.out.md: %.inp.md Makefile meta.md
	echo $@ from $<
	pandoc --to=markdown meta.md $< -o $@

clean:
	rm *.out.md
