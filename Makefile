all: clean update debuild pbuild

update:
	./git-pull-all

source:
	./debuildall

build:
	./pbuildall

init:
	./git-clone-all

clean:
	rm -f *.dsc *.changes *.tar.gz *.tar.xz *.build
