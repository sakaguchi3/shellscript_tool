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

  process=$(ps aux | grep "${app}")
  echo "> ${process}"
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

upload_file() {
  local download_target_extension="*.csv"
  local server="localhost"
  local ssh_user="user"
  local dir_remote="/tmp"
  local dir_local="/tmp"
  lcoal option="--remove-source-files"
  local ssh_key="~/.ssh/ssh_private"

  rsync -ahvz --progress --compress-level=9 ${option} \
    --include="${download_target_extension}" --exclude='*' \
    -e "ssh -i ${ssh_key}" \
    "${dir_local}/" "${ssh_user}@${server}:${dir_remote}/"

}

download_file() {
  local download_target_extension="*.csv"
  local server="localhost"
  local ssh_user="user"
  local dir_remote="/tmp"
  local dir_local="/tmp"
  lcoal option="--remove-source-files"
  local ssh_key="~/.ssh/ssh_private"

  rsync -ahvz --progress --compress-level=9 ${option} \
    --include="${download_target_extension}" --exclude='*' \
    -e "ssh -i ${ssh_key}" \
    "${ssh_user}@${server}:${dir_remote}/" "${dir_local}/"

}

: <<'Comment'
  Usage
       slack_wget ${token} {json}

  sample code START------------------------------>>
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

     slack_wget ${TOKEN} ${json}
  <<------------------------------END
Comment
slack_wget() {
  local token=$1
  local json=$2

  wget https://slack.com/api/chat.postMessage \
    --header="Authorization: Bearer ${token}" \
    --header='Content-type: application/json' \
    --post-data="${json}" \
    -O -
}

: <<'Comment'
  Usage
       slack_curl ${token} {json}

  sample code START------------------------------>>
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

     slack_curl ${TOKEN} ${json}
  <<------------------------------END
Comment
slack_curl() {
  local token=$1
  local json=$2

  curl https://slack.com/api/chat.postMessage \
    -X POST \
    -H "Authorization: Bearer ${token}" \
    -H 'Content-type: application/json' \
    -d "${json}"
}

# execute --------------------------------------------------

DIR_PROGRAM="/tmp/program"
source "${DIR_PROGRAM}/env.sh"
