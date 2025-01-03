#!/bin/bash

set -e
set -x

git submodule update --init --recursive

rm -rf ./rpmbuild
mkdir -p ./rpmbuild/SOURCES
cp *.patch ./rpmbuild/SOURCES

rpmlint ./chromebook-linux-audio.spec
rpmbuild --define "_topdir $PWD/rpmbuild" -bb ./chromebook-linux-audio.spec
rpm -qvlp ./rpmbuild/RPMS/**/*.rpm
rpm -qp --scripts ./rpmbuild/RPMS/**/*.rpm
