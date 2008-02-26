MODULES = tehpg
#DOCS = README.isbn_issn

DATA_built = tehpg.sql
DATA = uninstall_tehpg.sql


PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

