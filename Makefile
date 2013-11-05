
PG_CONFIG = pg_config

MODULES = bitstring_helpers
DOCS = bitstring_helpers.html

EXTRA_CLEAN = bitstring_helpers.html


DATA = bitstring_helpers--1.0.sql

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)




install: $(DOCS)


html: bitstring_helpers.html


bitstring_helpers.html: README.rst
	rst2html5 --bootstrap-css --pretty-print-code --jquery $< > $@



