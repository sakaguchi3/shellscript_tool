#!/bin/sh
#!/bin/sh -x

# ===============================================
# License: Apache License, Version 2.0
# Copyright (C) 2021 https://github.com/sakaguchi3/shellscript_tool
#
# version: xxx
# updated: yyyy/MM/dd
#
#=#=#=
# ```
# NAME
#       program name
# USAGE
#       xyz
# ```
#=#=
# ===============================================

# const --------------------------------------------------

# function --------------------------------------------------

empty_func() {
  :#
}

if_memo() {
  # 'if [式]' は 'if test 式' のシンタックスシュガー
  a=10
  b=3

  if [ $a -gt $b ]; then
    echo "a > b"
  fi

  if test $a -gt $b; then

    echo "a > b"
  fi
}

use_true() {
  flag=true
  if ("${flag}"); then
    echo "flag is ${flag}"
  fi

  flag=false
  if (! "${flag}"); then
    echo "flag is ${flag}"
  fi

}

if_file() {

  # ファイル or ディレクトリが存在するか
  if [ -e ${f} ]; then
    :#
  fi

  # ファイルが存在するか
  if [ -f ${f} ]; then
    :#
  fi

  # dirが存在するか
  if [ -d ${f} ]; then
    :#
  fi
}

if_tips() {
  var="fuga hoge piyo"
  if $(echo "$var" | grep -q "hoge"); then
    echo "found hoge"
  fi
  if ! $(echo "$var" | grep -q "hoge"); then
    echo "not found hoge"
  fi
}

if_and_or() {

  # (0 <= point) and  (point <= 100)
  point=5
  if [ 0 -le ${point} -a ${point} -le 100 ]; then
    :#
  fi

  # (point < 0) or (100 < 100)
  point=-100
  if [ ${point} -le 0 -o 100 -lt ${point} ]; then
    :#
  fi
}

if_str() {
  if [ 'abc' = 'abc' ]; then
    :#
  fi
  if [ 'abc' != 'xyz' ]; then
    :#
  fi

  # 長さが0のとき
  if [ -z "abc" ]; then
    :#
  fi
}

if_num() {
  # '='
  if [ 1 -eq 1 ]; then
    :#
  fi

  # '!='
  if [ 1 -ne 9 ]; then
    :#
  fi

  # '<'
  if [ 1 -lt 9 ]; then
    :#
  fi

  # '<='
  if [ 3 -le 3 ]; then
    :#
  fi

  # '<='
  if [ 3 -eq 3 ]; then
    :#
  fi
  if [ 3 -eq 4 ]; then
    :#
  fi

  # '>'
  if [ 9 -gt 1 ]; then
    :#
  fi

  # '>='
  if [ 9 -ge 9 ]; then
    :#
  fi
  if [ 9 -ge 8 ]; then
    :#
  fi

}

# execute --------------------------------------------------

DIR_PROGRAM="/tmp/program"
source "${DIR_PROGRAM}/env.sh"
