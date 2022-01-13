# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment, running Nginx as a reverse proxy/router.

## Notes

### `fastapi.environment.FORWARDED_ALLOW_IPS`

Allowing all (*) is a temporary solution.
We cannot resolve the proxy IP at runtime, and since it's unknown until the container is running, we need to just allow all for now.
Our public-facing reverse proxy should negate any security risks.

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
