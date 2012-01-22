#!/bin/bash
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

# オプション解析
# f.sh [-x] [-y VAL] [-z VAL]
parse_option() {
  # getopts
  #     a  ... オプションaは引数なし
  #     a: ... オプションaは引数あり
  while getopts xy:z: OPT; do
    case $OPT in
    "x") x_is_ok=true ;;
    "y")
      y_is_ok=true
      VALUE_Y="$OPTARG"
      ;;
    "z")
      z_is_ok=true
      VALUE_Z="$OPTARG"
      ;;
    *)
      echo "Usage: $CMDNAME [-x] [-y VALUE] [-z VALUE]" 1>&2
      exit 1
      ;;
    esac
  done

  if "${x_is_ok}"; then
    echo '"-x" founded'
  fi

  if "${y_is_ok}"; then
    echo '"-y" founded'
    echo "     val: ${VALUE_Y}"
  fi

  if "${z_is_ok}"; then
    echo '"-z" founded'
    echo "     val: ${VALUE_Z}"
  fi

}

tip_args1() {
  # 引数の個数
  n=$# # => 2

  # 引数が１行で返ってくる
  n=$@ # => "some_func ls -l"

  # 変数へのアクセス
  for x in "$@"; do
    echo "  ${x}"
  done
}

# f hello a 9 n 3 10
show_args1() {
  n=$@
  echo "$n" # => hello a 9 n 3 10
}

# f hello a 9 n 3 10
show_args2() {
  for x in "$@"; do
    echo "  ${x}"
  done
  # =>
  #     hello
  #     a
  #     9
  #     n
  #     3
  #     10
}

# f hello a 9 "n" 3 10
show_args_count() {
  n=$#
  echo "n is ${n}" # => n is 6
}
