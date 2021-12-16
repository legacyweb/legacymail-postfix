FROM alpine:latest

WORKDIR /app

RUN apk update \
  && apk add postfix \
  && rm -rf /var/cache/apk/* \
  && postconf "mynetworks=0.0.0.0/0" \
  && postconf "smtp_sasl_auth_enable=yes" \
  && postconf "smtpd_sasl_auth_enable=yes" \
  && postconf "smtp_sasl_tls_security_options=noanonymous" \
  && postconf "smtp_sasl_password_maps=lmdb:/etc/postfix/sasl_passwd" \
  && postconf "smtp_use_tls=yes" \
  && postconf "broken_sasl_auth_clients=yes" \
  && postconf "smtp_tls_CAfile=/etc/ssl/certs/ca-certificates.crt" \
  && cp /etc/postfix/main.cf /etc/postfix/main.cf.bak

COPY entrypoint.sh .

EXPOSE 25

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
