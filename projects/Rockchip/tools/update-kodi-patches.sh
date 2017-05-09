#!/bin/sh

SCRIPTPATH=$(dirname $0)
PKG_NAME=kodi
PKG_BASE=fc1619b118f6d503f920a49cf4ac4afcd0dd6b41

if [ ! -d .git ]; then
  echo "ERROR: current path is not a git repository"
  exit 1
fi

rm -v 00*.patch
git format-patch $PKG_BASE --no-signature

mkdir -p $SCRIPTPATH/../patches/$PKG_NAME
rm -v $SCRIPTPATH/../patches/$PKG_NAME/${PKG_NAME}-00*.patch

for f in 00*.patch; do
  mv -fv $f $SCRIPTPATH/../patches/$PKG_NAME/${PKG_NAME}-$f
done
