#!/bin/sh

# 引擎编译脚本，负责编译 cocos 和 framework 目录到 res 目录中去

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DEST_DIR=$DIR/res

#框架的源码包
COCOS_SOURCE=$QUICK_V3_ROOT/quick/cocos
FRAMEWORK_SOURCE=$QUICK_V3_ROOT/quick/framework
TMP_PATH=$QUICK_V3_ROOT/quick/tmp
FRAMEWORK_TARGET=framework

file=$FRAMEWORK_TARGET".zip"

rm -f $DEST_DIR/$file
rm -rf $TMP_PATH
mkdir $TMP_PATH
cp -rf $COCOS_SOURCE $TMP_PATH
cp -rf $FRAMEWORK_SOURCE $TMP_PATH

COMPILE_BIN=$QUICK_V3_ROOT/quick/bin/compile_scripts.sh 

ENCRYPT_COMMAND=""
if [ $1 ]; then
    ENCRYPT_COMMAND=" -e xxtea_zip -ek $1 -es YOUR_SIGN "
fi

# 编译framework脚本文件 64位
$COMPILE_BIN -b 64 -i $TMP_PATH -o $DEST_DIR/$file $ENCRYPT_COMMAND
rm -rf $TMP_PATH
