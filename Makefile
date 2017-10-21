.PHONY: all clear deploy

all : $(shell ls lecture*.md | sed 's/md/html/g') index.html

index.html : README.md
	echo '<!DOCTYPE html>' > $@
	echo '<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">' >> $@
	cat README.md | sed 's/\.md/\.html/g' | markdown >> index.html

lecture%.html : lecture%.md
	echo '<!DOCTYPE html>' > $@
	echo '<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">' >> $@
	cat $< | sed 's/ -- / — /g' | markdown >> $@

clean :
	rm -rf *.html

deploy : all
	scp *.html maevsky@rain.ifmo.ru:public_html/networks/