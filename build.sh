#!/bin/bash

rpm -q rpm-build rpmdevtools readline-devel ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel byacc libyaml-devel gcc make glibc-devel

if [ $? -ne 0 ]; then
  echo "Some required packages is not installed."
  exit 1
fi

HOME=$(cd $(dirname $0) && pwd)

rpmdev-setuptree
cd ${HOME}/rpmbuild/SOURCES
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
cd ${HOME}/rpmbuild/SPECS
cp ../../ruby19.spec ./
rpmbuild -bb ruby19.spec
