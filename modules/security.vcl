#!/bin/sh
# grab and install security.vcl
# comotion@krutt.org

PKG=security.vcl
REPO=git://github.com/comotion/$PKG.git

mkdir -p inst
cd inst
if [ ! -d $PKG/.git ]
then
   git clone $REPO
fi

cd $PKG
git pull

ln -sf $PWD /etc/varnish/security
