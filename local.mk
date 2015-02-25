# Local Make rules.
#
# Copyright (C) 2013-2015 Gary V. Vaughan
# Written by Gary V. Vaughan, 2013
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


## ------------ ##
## Environment. ##
## ------------ ##

std_path = $(abs_srcdir)/lib/?.lua;$(abs_srcdir)/lib/?/init.lua
LUA_ENV  = LUA_PATH="$(std_path);$(LUA_PATH)"


## ---------- ##
## Bootstrap. ##
## ---------- ##

#old_NEWS_hash = d41d8cd98f00b204e9800998ecf8427e

update_copyright_env = \
	UPDATE_COPYRIGHT_HOLDER='(Gary V. Vaughan|Reuben Thomas)' \
	UPDATE_COPYRIGHT_USE_INTERVALS=1 \
	UPDATE_COPYRIGHT_FORCE=1


## ------------- ##
## Declarations. ##
## ------------- ##

classesdir		= $(docdir)/classes
modulesdir		= $(docdir)/modules

dist_doc_DATA		=
dist_classes_DATA	=
dist_modules_DATA	=

#include specs/specs.mk


## ------ ##
## Build. ##
## ------ ##

luarrtdir = $(luadir)/rrt

dist_luarrt_DATA =			\
	lib/rrt/bin.lua			\
	lib/rrt/csv.lua			\
	lib/rrt/fstable.lua		\
	lib/rrt/lcs.lua			\
	lib/rrt/list.lua		\
	lib/rrt/mbox.lua		\
	lib/rrt/parser.lua		\
	lib/rrt/xml.lua			\
	$(NOTHING_ELSE)


## Use a builtin rockspec build with root at $(srcdir)/lib, and note
## the github repository doesn't have the same name as the rockspec!
mkrockspecs_args = --module-dir $(srcdir)/lib --repository lua-stdlib


## ------------- ##
## Distribution. ##
## ------------- ##

EXTRA_DIST +=				\
	build-aux/config.ld.in		\
	$(NOTHING_ELSE)


## -------------- ##
## Documentation. ##
## -------------- ##


dist_doc_DATA +=			\
	$(srcdir)/doc/index.html	\
	$(srcdir)/doc/ldoc.css

dist_modules_DATA +=				\
	$(srcdir)/doc/modules/bin.html		\
	$(srcdir)/doc/modules/csv.html		\
	$(srcdir)/doc/modules/fstable.html	\
	$(srcdir)/doc/modules/lcs.html		\
	$(srcdir)/doc/modules/list.html		\
	$(srcdir)/doc/modules/mbox.html		\
	$(srcdir)/doc/modules/parser.html	\
	$(srcdir)/doc/modules/xml.html		\
	$(NOTHING_ELSE)

## Parallel make gets confused when one command ($(LDOC)) produces
## multiple targets (all the html files above), so use the presence
## of the doc directory as a sentinel file.
$(dist_doc_DATA) $(dist_classes_DATA) $(dist_modules_DATA): $(srcdir)/doc

$(srcdir)/doc: $(dist_lua_DATA) $(dist_luastd_DATA)
	test -d $@ || mkdir $@
	$(LDOC) -c build-aux/config.ld -d $(abs_srcdir)/doc .
