#!/bin/sh

. ./configure.inc

config_dirs="conf src utils scripts doc filters \
    tclhttpd \
    tclmetar \
    tclupperair \
    tclgrads \
    tclssh \
    tclgempak"

configure_default
configure_default Makefile.inc

savedir=`pwd`
for d in $config_dirs
do
    cd $d
    ./configure.sh
    cd $savedir
done
