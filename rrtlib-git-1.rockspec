package = "rrtlib"
version = "git-1"
source = {
  url = "git://github.com/rrthomas/lua-rrtlib.git",
}
build = {
  copy_directories = {
  },
  build_command = "./bootstrap && ./configure LUA_INCLUDE=$(LUA_INCDIR) LUA=$(LUA) CPPFLAGS=-I$(LUA_INCDIR) --prefix=$(PREFIX) --libdir=$(LIBDIR) --datadir=$(LUADIR) && make clean all",
  install_command = "make install luadir=$(LUADIR)",
  type = "command",
}
description = {
  summary = "Ad-hoc Lua libraries",
  detailed = "    rrtlib is an ad-hoc library of modules for various tasks.\
 ",
  homepage = "http://github.com/rrthomas/lua-rrtlib/",
  license = "MIT/X11",
}
dependencies = {
  "lua >= 5.1",
}
