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

loop_files() {
  dir='/tmp'

  for f in "${dir}"/*; do
    # ファイルのとき
    if [ -e ${f} ]; then
      :#
    elif [ -d ${f} ]; then
      :#
    fi
  done
}

loop_for() {
  for i in $(seq 1 10); do
    :#
  done

  arr=('a' 'b' 'c')
  for i in "${arr[@]}"; do
    :#
  done
}

loop_wile() {
  while true; do
    sleep 10
  done

}
