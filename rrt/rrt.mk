# lua-rrtlib make rules.


## ------ ##
## Build. ##
## ------ ##

## Use, e.g. `require "rrt.list"` for individual modules.
nobase_dist_lua_DATA = 			\
	rrt/bin.lua			\
	rrt/fstable.lua			\
	rrt/lcs.lua			\
	rrt/mbox.lua			\
	rrt/parser.lua			\
	rrt/xml.lua			\
	$(NOTHING_ELSE)

## But, `require "rrt"` for core module.
dist_lua_DATA =				\
	rrt/rrt.lua			\
	$(NOTHING_ELSE)

# In order to avoid regenerating rrt.lua at configure time, which
# causes the documentation to be rebuilt and hence requires users to
# have luadoc installed, put rrt/rrt.lua in as a Makefile dependency.
# (Strictly speaking, distributing an AC_CONFIG_FILE would be wrong.)
rrt/rrt.lua: rrt/rrt.lua.in
	./config.status --file=$@


## ------------- ##
## Distribution. ##
## ------------- ##

EXTRA_DIST +=				\
	rrt/rrt.lua.in			\
	$(NOTHING_ELSE)


## -------------- ##
## Documentation. ##
## -------------- ##

dist_doc_DATA +=				\
	$(top_srcdir)/rrt/index.html	\
	$(top_srcdir)/rrt/luadoc.css

dist_files_DATA += $(wildcard $(top_srcdir)/rrt/files/*.html)
dist_modules_DATA += $(wildcard $(top_srcdir)/rrt/modules/*.html)

$(dist_doc_DATA): $(nobase_dist_lua_DATA)
	cd rrt && $(LUADOC) *.lua
