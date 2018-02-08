dnl Process this file with autoconf to produce a configure script

dnl Initialise autoconf and automake
AC_INIT(rrtlib, 1, rrt@sc3d.org)
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([foreign])
AM_SILENT_RULES([yes])

dnl Lua
AX_PROG_LUA([5.1], [5.4])

AC_PATH_PROG([LDOC], [ldoc], [:])

dnl Generate output files
AC_CONFIG_MACRO_DIR(m4)
AC_CONFIG_FILES([Makefile build-aux/config.ld])
AC_OUTPUT
