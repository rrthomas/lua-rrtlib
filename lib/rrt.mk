# lua-rrtlib make rules.


## ------ ##
## Build. ##
## ------ ##

nobase_dist_lua_DATA = 			\
	rrt/bin.lua			\
	rrt/csv.lua			\
	rrt/fstable.lua			\
	rrt/lcs.lua			\
	rrt/list.lua			\
	rrt/parser.lua			\
	rrt/xml.lua			\
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
