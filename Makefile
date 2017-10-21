index.html : README.md lecture2.html
	cat README.md | sed 's/\.md/\.html/g' | markdown > index.html

lecture%.html : lecture%.md
	cat $< | sed 's/ -- / — /g' | markdown > $@

clear :
	rm -rf *.html