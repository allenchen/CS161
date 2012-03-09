#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: $0 input.apk"
  exit 1
fi

TMPDIR=./`basename $1 .apk`
SMALI=$HOME/tools/smali/smali
DEX2JAR=$HOME/tools/dex2jar/dex2jar.sh
JAD=$HOME/tools/jad/jad

apktool d $1 $TMPDIR
pushd $TMPDIR

$SMALI smali -o out.dex
$DEX2JAR out.dex
mkdir jar
cd jar
unzip ../out_dex2jar.jar
for f in `find . -name "*.class"`; do $JAD -p $f > `dirname $f`/`basename $f .class`.java && rm $f; done
rm ../out_dex2jar.jar
rm ../out.dex

# popd
