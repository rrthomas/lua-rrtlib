rrtlib: Ad-hoc Lua libraries
============================

[![travis-ci status](https://secure.travis-ci.org/rrthomas/lua-rrtlib.png?branch=master)](http://travis-ci.org/rrthomas/lua-rrtlib/builds)


This is a collection of Lua libraries for Lua 5.1 and 5.2. The
libraries are copyright by their authors 2000-2013 (see the AUTHORS
file for details), and released under the MIT license (the same
license as Lua itself). There is no warranty.

Rrtlib requires stdlib. The following modules have extra dependencies:

    fstable: Lua 5.2, lfs, luaposix


Installation
------------

The simplest way to install rrtlib is with [LuaRocks][]. rrtlib does
not have formal releases, so to install current git master:

    luarocks install https://raw.github.com/rrthomas/lua-rrtlib/release/rrtlib-git-1.rockspec

To install without LuaRocks, check out the sources from the
[repository][github], and then run the following commands: the
dependencies are listed in the dependencies entry of the file
`rrtlib-rockspec.lua`. You will also need autoconf and automake.

    cd lua-rrtlib
    autoreconf --force --version --install
    ./configure --prefix=INSTALLATION-ROOT-DIRECTORY
    make all check install

See [INSTALL][] for instructions for `configure`.

[luarocks]: http://www.luarocks.org "LuaRocks Project"
[install]: https://raw.github.com/rrthomas/lua-rrtlib/master/INSTALL

Use
---

For a library "foo", use something like:

    foo = require "rrt.foo"


Documentation
-------------

The libraries are [documented in LuaDoc][github.io]. Pre-built HTML
files are included.

[github.io]: http://rrthomas.github.io/lua-rrtlib


Bug reports and code contributions
----------------------------------

These libraries are written and maintained by their users. Please make
bug report and suggestions on GitHub (see URL at top of file). Pull
requests are especially appreciated.
