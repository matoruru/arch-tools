#!/usr/bin/env bash

SOURCE=/etc/pacman.d/mirrorlist
TARGET=/etc/pacman.d/mirrorlist

cat $SOURCE | sed -n -e "/## Japan/,+1p"                         > sedtmp_1
cat $SOURCE | sed    -e "/## Japan/{n;d}" | sed -e "/## Japan/d" > sedtmp_2

cat sedtmp_1 sedtmp_2 > $TARGET

rm sedtmp_1 sedtmp_2
