#!/bin/sh
POSTFIX_MAIN_CF=/etc/postfix/main.cf
POSTFIX_SASL_PASSWD=/etc/postfix/sasl_passwd
POSTFIX_LOG=/var/log/postfix.log
SMTP_DST_PORT=${SMTP_DST_PORT:=587}

cp $POSTFIX_MAIN_CF.bak $POSTFIX_MAIN_CF
postconf "relayhost=[${SMTP_DST_HOST}]:${SMTP_DST_PORT}"

echo "[${SMTP_DST_HOST}]:${SMTP_DST_PORT} ${EMAIL_USERNAME}:${EMAIL_PASSWORD}" > $POSTFIX_SASL_PASSWD

postmap $POSTFIX_SASL_PASSWD

newaliases

postconf maillog_file=${POSTFIX_LOG}

postfix start

tail -f ${POSTFIX_LOG}
