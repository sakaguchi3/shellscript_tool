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

move_dir() {
  src="/tmp/spring/log"
  dst="/tmp/bakcup/spring_log"
  find "$src"/ -name "*.log" -type f | xargs -I{} mv {} "${dst}"/
}

consurrent_f() {
  dir="/tmp"
  # 2スレッド並列処理で圧縮, -P{num}
  find "$dir" -name "*.csv" -type f | xargs -I{} -P2 gzip -9 {}
}


