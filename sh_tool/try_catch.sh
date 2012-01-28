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

# try-catch --------------------------------------------------

set -eu

trap catch ERR
trap finally EXIT

function catch() {
  echo  "Catch"
}
function finally() {
  echo  "Finally"
}

# execute --------------------------------------------------

your_app.sh
echo ""

