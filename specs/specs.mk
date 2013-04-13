# Specl specs make rules.


## ------------ ##
## Environment. ##
## ------------ ##

SPECL_ENV = $(LUA_ENV)


## ------ ##
## Tools. ##
## ------ ##

## We're using improved sanity Specl-5 should_error ordering.
SPECL     ?= specl
SPECL_MIN  = 5


## ------ ##
## Specs. ##
## ------ ##

specl_SPECS =					\
	$(NOTHING_ELSE)

check_local += specs-check-local
specs-check-local:
	@v=`$(SPECL) --version | sed -e 's|^.* ||' -e 1q`;		\
	if test "$$v" -lt "$(SPECL_MIN)"; then				\
	  printf "%s%s\n%s\n"						\
	    "ERROR: Specl version $$v is too old,"			\
	    " please upgrade to at least version $(SPECL_MIN),"		\
	    "ERROR: and rerun \`make check\`";				\
	  exit 1;							\
	else								\
	  $(SPECL_ENV) $(SPECL) $(SPECL_OPTS) $(specl_SPECS);		\
	fi


## ------------- ##
## Distribution. ##
## ------------- ##

EXTRA_DIST +=				\
	$(specl_SPECS)			\
	$(NOTHING_ELSE)
