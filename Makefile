.PHONY: all clear deploy

all : $(shell ls lecture*.md | sed 's/md/html/g') index.html

index.html : README.md lecture2.html
	cat README.md | sed 's/\.md/\.html/g' | markdown > index.html

lecture%.html : lecture%.md
	cat $< | sed 's/ -- / — /g' | markdown > $@

clear :
	rm -rf *.html

deploy : all
	scp *.html maevsky@rain.ifmo.ru:public_html/networks/