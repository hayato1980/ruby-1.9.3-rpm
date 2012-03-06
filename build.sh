#!/bin/bash

yum install -y rpm-build rpmdevtools readline-devel ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel byacc

HOME=$(cd $(dirname $0) && pwd)

rpmdev-setuptree
cd ${HOME}/rpmbuild/SOURCES
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz
cd ${HOME}/rpmbuild/SPECS
wget https://raw.github.com/imeyer/ruby-1.9.3-rpm/master/ruby19.spec
rpmbuild -bb ruby19.spec
