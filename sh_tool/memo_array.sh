#!/bin/bash
#!/bin/bash -x

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

rm_array() {
  :#
  # 2番目の要素を削除
  a=("a" "b" "c")
  unset a[1]
  # 配列を詰め直す
  a=("${a[@]}")
}

append_array() {

  # append head
  array=("a" "b" "c")
  array=("z" "${array[@]}") # => (z a b c)

  # append tail
  array=("a" "b" "c")
  array=("${array[@]}" "z") # => ( a b c z)

  # append tail
  array=("a" "b" "c")
  array+=( "z" ) # => ( a b c z)
}


print_array(){
  # 配列の中身を表示する
  declare -a arr=(a b c)

  declare -p arr # => declare -a array(a b c)
  echo "${arr[@]}" # => a b c
}

tips_array(){
   # 要素数
   arr=(a b c)
   arr_size="${#arr[@]}" # => 3
}

read_array() {
  a=$(seq 1 10)

  for v in ${a[*]}; do
    echo "$v"
  done

  for v in "${a[@]}"; do
    echo "$v"
  done

  # like c
  for ((i=0; i<${#a[@}; i++)){
    echo "a[$i] = ${a[i]}"
  }

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

  # show values
  echo "${hash[@]}" # => 11 12 13

  # show keys
  echo "${!hash[@]}" # => Jack Queen King
}

# execute --------------------------------------------------
