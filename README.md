This is a capability module used to configure your application with access and credentials in order to send email via Gmail.
This module has one connection to a Gmail SMTP Host block.
This module takes the credentials configured in this block and injects them into your application via environment variables.

### Ports
The following ports are opened for egress in order to allow your outbound smtp request.
587 - unsecured port
586 - secured port using TLS

### Env Variables
The following environment variables are automatically injected into your application.
EMAIL_ACCOUNT
EMAIL_PASSWORD
