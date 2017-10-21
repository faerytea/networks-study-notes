index.html : README.md lecture2.html
	cat README.md | sed 's/\.md/\.html/g' | markdown > index.html

lecture2.html : lecture2.md
	markdown lecture2.md > lecture2.html

clear :
	rm -rf *.html