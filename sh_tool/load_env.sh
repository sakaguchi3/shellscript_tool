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

check_param() {
  if [ -z "${ENV_API1_TOKEN}" ]; then
    exit 0
  fi
  if [ -z "${ENV_API2_TOKEN}" ]; then
    exit 0
  fi

}
# execute --------------------------------------------------

DIR_PROG="/tmp/prog/sample"

if [ ! -d "${DIR_PROG}" ]; then
  echo "[ERROR] not found> ${DIR_PROG}"
  exit 0
fi

if [ ! -e "${DIR_PROG}/env.sh" ]; then
  echo "[ERROR] not found> ${DIR_PROG}/env.sh"
  exit 0
fi

source "${DIR_PROG}/env.sh"
