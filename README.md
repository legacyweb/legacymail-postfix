# legacymail-postfix
Authentication component for legacymail.

This is useful if your old mail client doesn't support SASL authentication.

## Variables

|Variable name|Purpose|Default|
|-------------|-------|-------|
|SMTP_DST_HOST|Hostname of remote SMTP server (i.e. smtp.gmail.com)|N/A|
|SMTP_DST_PORT|SMTP **relay** port for the remote email server|587|
|EMAIL_USERNAME|The email username (usually your email address) for login|N/A|
|EMAIL_PASSWORD|The password for your email address|N/A|