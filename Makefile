all: RPS-SPEC.html

%.html: %.md
	ruby fmt.rb <$^ >$@

push: all
	cp RPS-SPEC.html site/index.html
	cd site && git commit -a -m "`date`" && git push
