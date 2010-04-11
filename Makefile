all: RPS-SPEC.html

%.html: %.md
	ruby fmt.rb <$^ >$@