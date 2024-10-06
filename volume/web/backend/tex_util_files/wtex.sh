#!/bin/sh

tmp=`mktemp`
env >> $tmp
pwd >> $tmp
echo "$@" >> $tmp

exec /home/mnt/ziyou/Html/e_school/emath/latex/wtex.pl "$@" > $tmp 2>&1
