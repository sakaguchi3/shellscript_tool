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

# remove file that ware made more than 5days ago
func_remove_5min_ago() {
  local dirs_rm_target=(
    "/log/dir1"
    "/log/dir2"
  )
  local file_name="*.log"
  local ago_min=5

  for dir in "${dirs_rm_target[@]}"; do
    # t in (-n, today]
    # find ${dir} -type f -name '*.log' -cmin -${ago_min} | xargs rm -f

    # t in (-(n+1), -n]
    #     find ${dir} -type f -name '*.log' -cmin ${ago_min} | xargs rm -f

    # t in (-infinite, -n)
    find ${dir}/ -type f -name "${file_name}" -cmin +${ago_min} -print | xargs rm -f
  done
}

# remove file that ware made more than 5days ago
func_remove_5days_ago() {
  local dirs_rm_target=(
    "/log/dir1"
    "/log/dir2"
  )
  local file_name="*.log"
  local ago_day=5

  for dir in "${dirs_rm_target[@]}"; do
    # t in (-n, today]
    # find ${dir} -type f -name '*.log' -ctime -${ago_day} | xargs rm -f

    # t in (-(n+1), -n]
    # find ${dir} -type f -name '*.log' -ctime ${ago_day} | xargs rm -f

    # t in (-infinite, -n)
    find ${dir}/ -type f -name "${file_name}" -ctime +${ago_day} -print | xargs rm -f
  done
}
