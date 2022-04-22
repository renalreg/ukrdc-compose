# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment, running Nginx as a reverse proxy/router.

## Notes

### `fastapi.environment.FORWARDED_ALLOW_IPS`

Uvicorn uses `FORWARDED_ALLOW_IPS` to determine which proxy IPs are allowed to access the server.

We cannot resolve the proxy IP at runtime, and since it's unknown until the container is running.
However, we set up our compose stack such that the API host is only ever accessed via it's internal IP address. All external connections are blocked (no exposed ports), and all traffic comes in via the `nginx` reverse proxy. Therefore, we set `FORWARDED_ALLOW_IPS` to allow all IP's to get around this issue.

### `fastapi.environment.ALLOW_ORIGINS`

While we have the option to specify allowed origins for the API, we don't need to do this in production since the UI is served on the same origin under a different path, behind a reverse proxy.

## Example environment

### Staging

```none

# API

WOTD='["Staging server for testing purposes only."]'

SWAGGER_CLIENT_ID="0oan75eooLX2DcdQK5d6"

MIRTH_URL="https://staging-mirth.ukrdc.nhs.uk/api"
MIRTH_VERIFY_SSL=false
MIRTH_USER="webapi"

UKRDC_HOST="staging-db.ukrdc.nhs.uk"
JTRACE_HOST="staging-db.ukrdc.nhs.uk"
ERRORS_HOST="staging-db.ukrdc.nhs.uk"

UKRDC_USER="ukrdc"
JTRACE_USER="ukrdc"
ERRORS_USER="ukrdc"

MIRTH_PASS="****"
UKRDC_PASS="****"
JTRACE_PASS="****"
ERRORS_PASS="****"

# App

APP_CLIENT_ID=0oan98slw3m4mnhxq5d6

# Common

DEPLOYMENT_ENV="staging"
OAUTH_ISSUER=https://renalregistry.okta.com/oauth2/ausn7fa9zfh1DC2La5d6

```
