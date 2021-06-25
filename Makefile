### WORKFLOW

build: table-of-contents clean

table-of-contents: deps
	git ls-files | grep "md" | xargs -n1 gh-md-toc --insert

clean:
	rm -vf *.md.orig.*
	rm -vf *.md.toc.*


### BOOTSTRAPPING

deps:
	@which basher > /dev/null || make get-deps
	@which gh-md-toc > /dev/null || make get-deps

get-deps:
	@echo "Dependencies:"
	@echo "  - basher	https://github.com/basherpm/basher#installation"
	@echo "  - gh-md-toc	https://github.com/ekalinin/github-markdown-toc#installation"


.PHONY: build table-of-contents clean deps get-deps
