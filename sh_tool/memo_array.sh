#!/bin/bash

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

read_array() {
  a=$(seq 1 10)

  for v in ${a[*]}; do
    echo "$v"
  done

  for v in "${a[@]}"; do
    echo "$v"
  done

}

hash_array() {
  declare -A hash=([Jack]=11 [Queen]=12 [King]=13)

  echo -n "hash="
  declare -p hash
  echo ""

  for k in ${!hash[*]}; do
    v="${hash[$k]}"
    echo "(k,v)=(${k}, ${v})"
  done
}

# execute --------------------------------------------------
