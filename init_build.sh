#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR=$DIR/.data/src
DEST_DIR=$DIR/.data
TARGET_FILE=init

COMPILE_BIN=$QUICK_V3_ROOT/quick/bin/compile_scripts.sh 

mkdir $DEST_DIR
mkdir $SCRIPTS_DIR

# 编译游戏脚本文件
file=$TARGET_FILE".zip"

rm $SCRIPTS_DIR/*.lua
rm -f $DEST_DIR/$file

cp -f $DIR/src/*.lua $SCRIPTS_DIR/

ENCRYPT_COMMAND=""
if [ $1 ]; then
    ENCRYPT_COMMAND=" -e xxtea_zip -ek $1 -es YOUR_SIGN "
fi

$COMPILE_BIN -b 64 -i $SCRIPTS_DIR -o $DEST_DIR/$file $ENCRYPT_COMMAND
