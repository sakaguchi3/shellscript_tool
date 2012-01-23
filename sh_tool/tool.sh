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

kill_app() {
  app=$1

  read -p "kill '${app}'-process(yes/no)?>" str

  case "${str}" in
  yes)
    echo "YES"
    ;;
  no)
    echo "NO"
    exit 0
    ;;
  *)
    echo "invalid parameter. input yes/no"
    exit 0
    ;;
  esac

  ps aux |
    grep "${app}" |
    grep -v grep |
    awk '{ print "kill", $2 }' |
    sh
}

mysql_insert() {
  MYSQL_APP='/usr/bin/mysql'
  MYSQL_USER='usr'
  MYSQL_PASSWORD='pass'
  MYSQL_HOST='localhost:3306'
  MYSQL_DATABASE='db'
  MYSQL_SQL="select 1"
  MYSQL_SSL="--ssl-ca=/tmp/ssl/cert.pem --ssl-mode=VERIFY_CA"
  eval "${MYSQL_APP} -h ${MYSQL_HOST} -u ${MYSQL_USER} -p ${MYSQL_DATABASE} ${MYSQL_SSL} --password=${MYSQL_PASSWORD} -e ${MYSQL_SQL}"
}

ssh_t() {
  SSH_HOST='localhost:22'
  SSH_USR='user'
  SSH_KEY="${HOME}/.ssh/ssh_private_kwy"
  SSH_LOG="/tmp/log/ssh.log"
  ssh -tt "${SSH_USR}"@"${SSH_HOST}" -i "${SSH_KEY}" >>"${SSH_LOG}" 2>&1 <<EOS
    echo  "something command"
EOS

}

random() {
  random=$(cat /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | fold -w 40 | head -n1)
  echo ${random}
}

logger() {
  str=$1
  LOG_FILE='/tmp/log/sample_shell.log'
  JST=$(TZ="Asia/Tokyo" date --date="now" "+%Y%m%d_%H%M%S")
  echo "[info]${JST} - ${str}" >>${LOG_FILE}
}

slack() {
  CHANNEL='xxxx'
  text_attache="sample"

  # warning, good or clolr code(#ff0000)
  color="warning"
  attachments='[{"attachment_type":"default", "text":'${text_attache}',"color":'${color}'}]'
  text='xxx'
  json=$(
    cat <<EOS
		{
		  "channel": "${CHANNEL}",
		  "text": "${text}",
		  "attachments":${attachments}
		}
EOS
  )
  TOKEN='xxxx'
  wget https://slack.com/api/chat.postMessage \
    --header='Authorization: Bearer'${TOKEN} \
    --header='Content-type: application/json' \
    --post-data="${json}" \
    -O -

}

# execute --------------------------------------------------

DIR_PROGRAM="/tmp/program"
source "${DIR_PROGRAM}/env.sh"
