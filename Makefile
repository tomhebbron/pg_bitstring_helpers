
PG_CONFIG = pg_config

MODULES = bitstring_helpers
DOCS = README.bitstring_helpers

DATA = bitstring_helpers--1.0.sql

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

