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

measure_time() {
  start=$(date +%s)
  # program
  sleep 3
  end=$(date +%s)

  time=$((end - start))

}

filename() {
  file="/tmp/hoge.txt"
  filename=$(basename "${file}")
}

aws_s3_upload() {
  file="/tmp/hoge.txt"
  filename=$(basename $file)
  AWS_APP="/tmp/bin/aws"
  BUCKET="s3:xxxxx"
  S3_DIR="s3_dir"

  ${AWS_APP} s3 cp "${file}" "${BUCKET}/${S3_DIR}/${filename}"
}

confirm() {
  read -p "continue(yes/no)? > " str
  case "${str}" in
  yes)
    echo "YES"
    ;;
  no)
    echo "NO"
    echo "end"
    exit 0
    ;;
  *)
    echo "invalid parameter. INPUT 'Yes' or 'no'"
    confirm
    ;;
  esac
}
check_if_contain() {
  ALLOW_TYPE=('x' 'y' 'z')

  type="z"
  if ! $(echo "${ALLOW_TYPE[@]}" | grep -q "${type}"); then
    echo "invalid parameter. :${LOG_TYPE}"
    return
  fi

}

empty_func() {
  :#
}

if_tips() {
  var="fuga hoge piyo"
  if $(echo "$var" | grep -q "hoge"); then
    echo "found hoge"
  fi
  if ! $(echo "$var" | grep -q "hoge"); then
    echo "not found hoge"
  fi
}

if_and_or() {

  # (0 <= point) and  (point <= 100)
  point=5
  if [ 0 -le ${point} -a ${point} -le 100 ]; then
    :#
  fi

  # (point < 0) or (100 < 100)
  point=-100
  if [ ${point} -le 0 -o 100 -lt ${point} ]; then
    :#
  fi
}

if_str() {
  if [ 'abc' = 'abc' ]; then
    :#
  fi
  if [ 'abc' != 'xyz' ]; then
    :#
  fi

  # 0文字以上
  if [ -z "abc" ]; then
    :#
  fi
  if [ ! -z $abc ]; then
    abc="initialize"
  fi

}
if_num() {
  # '='
  if [ 1 -eq 1 ]; then
    :#
  fi

  # '!='
  if [ 1 -ne 9 ]; then
    :#
  fi

  # '<'
  if [ 1 -lt 9 ]; then
    :#
  fi

  # '<='
  if [ 3 -le 3 ]; then
    :#
  fi

  # '<='
  if [ 3 -eq 3 ]; then
    :#
  fi
  if [ 3 -eq 4 ]; then
    :#
  fi

  # '>'
  if [ 9 -gt 1 ]; then
    :#
  fi

  # '>='
  if [ 9 -ge 9 ]; then
    :#
  fi
  if [ 9 -ge 8 ]; then
    :#
  fi

}

data_size() {
  filepath="/tmp/a.tar.gz"
  data_size=$(wc -c "${filepath}" | awk '{print $1}')
}

# execute --------------------------------------------------

DIR_PROGRAM="/tmp/program"
source "${DIR_PROGRAM}/env.sh"
