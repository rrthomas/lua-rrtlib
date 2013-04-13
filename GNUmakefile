## maintainer rules.

dont-forget-to-bootstrap = $(wildcard Makefile)

ifeq ($(dont-forget-to-bootstrap),)

Makefile: Makefile.in
	./configure
	$(MAKE)

Makefile.in:
	./bootstrap

endif

# Use 'make check V=1' for verbose output, or set SPECL_OPTS to
# pass alternative options to specl command.
SPECL_OPTS ?= $(specl_verbose_$(V))
specl_verbose_ = $(specl_verbose_$(AM_DEFAULT_VERBOSITY))
specl_verbose_0 =
specl_verbose_1 = --verbose --formatter=report

include Makefile

ROCKSPEC_ENV	  = $(LUA_ENV)
MKROCKSPECS 	  = $(ROCKSPEC_ENV) $(LUA) $(srcdir)/build-aux/mkrockspecs
ROCKSPEC_TEMPLATE = $(srcdir)/rockspecs.lua

LUA_BINDIR ?= $(shell which $(LUA) |sed 's|/[^/]*$$||')
LUA_INCDIR ?= `cd $(LUA_BINDIR)/../include && pwd`
LUA_LIBDIR ?= `cd $(LUA_BINDIR)/../lib && pwd`

luarocks-config.lua: GNUmakefile
	$(AM_V_GEN){						\
	  echo 'rocks_trees = { "$(abs_srcdir)/luarocks" }';	\
	  echo 'variables = {';					\
	  echo '  LUA = "$(LUA)",';				\
	  echo '  LUA_BINDIR = "'$(LUA_BINDIR)'",';		\
	  echo '  LUA_INCDIR = "'$(LUA_INCDIR)'",';		\
	  echo '  LUA_LIBDIR = "'$(LUA_LIBDIR)'",';		\
	  echo '}';						\
	} > '$@'

rockspecs: luarocks-config.lua $(srcdir)/build-aux/mkrockspecs $(ROCKSPEC_TEMPLATE)
	$(AM_V_at)rm -f *.rockspec
	@echo "  GEN      $(PACKAGE)-git-1.rockspec"
	$(AM_V_at)$(MKROCKSPECS) $(PACKAGE) git $(ROCKSPEC_TEMPLATE)

GIT ?= git
