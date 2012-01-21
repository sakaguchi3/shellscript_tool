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

func_rsync_make_dir() {
  dir_nest="/tmp/x/y/z"
  ssh_user="usr"
  ssh_host="localhost"

  # copy to remote on '/tmp/x/y/z'
  rsync -a \
    --rsync-path="mkdir -p ${dir_nest} && rsync ${dir_nest}" \
    "${ssh_user}@${ssh_host}:/${dir_nest}"

}

func_rsync_relative() {
  dir_nest="/tmp/x/y/z"
  ssh_user="usr"
  ssh_host="localhost"

  # copy to remote on '/pre_exsisting/tmp/x/y/z'
  rsync -a \
    --relative "${dir_nest}" "${ssh_user}@${ssh_host}":/pre_existing/

}
