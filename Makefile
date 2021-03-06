# Build prerequisites
#
#   1. a sane GNU system
#   2. embedmd (https://github.com/campoy/embedmd)

.PHONY: all clean

SOURCES := $(sort $(wildcard chapters/*.md))
SQL := $(wildcard chapters/sql/*.sql)
PROCESSED := $(SOURCES:chapters/%.md=manuscript/%.md)

all: $(PROCESSED)

manuscript/%.md: chapters/%.md $(SQL)
	mkdir -p manuscript
	embedmd $< | sed '/^<!-- vim:/d' > $@

clean:
	rm -fr manuscript

# vim:ft=make:
