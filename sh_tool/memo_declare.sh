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

f() {
  # array
  declare -a array=(a b c)

  # 変数の中身を表示
  declare -p array # => declare -a array(a b c)

  # int
  declare -i num=3

  # read only
  declare -r read_only="abcd"

  # always upper case
  declare -u up_val
  up_val="aaa" # => AAA

  # always lower case
  declare -u low_val
  low_val="AAA" # =>aaa

}
