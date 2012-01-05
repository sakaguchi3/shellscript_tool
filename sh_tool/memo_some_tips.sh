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

rsync_f() {
  server="localhost"
  dst="/tmp"

  # download
  rsync -ahz --progress --compress-level=9 \
    --remove-source-files \
    --include="*.csv" --exclude='*' \
    user@"${server}":/logs/ "${dst}/"

  # with ssh
  key="~/.ssh/secret"
  rsync -ahz --progress --compress-level=9 \
    --remove-source-files \
    --include="*.csv" --exclude='*' \
    -e "ssh -i ${key}" user@"${server}":/logs/ "${dst}/"
}

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

data_size() {
  filepath="/tmp/a.tar.gz"
  data_size=$(wc -c "${filepath}" | awk '{print $1}')
}

# execute --------------------------------------------------

DIR_PROGRAM="/tmp/program"
source "${DIR_PROGRAM}/env.sh"
