# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment, running Nginx as a reverse proxy/router.

## .env variables

An example/template .env file can be found in [.env.template](./.env.template)

### Example - Staging

```none
DEPLOYMENT_ENV="staging"

APP_BASE="/new/app"
API_BASE="/new/api"

OAUTH_ISSUER=https://renalregistry.okta.com/oauth2/ausn7fa9zfh1DC2La5d6
OAUTH_AUDIENCE=api://ukrdc
APP_CLIENT_ID=0oan98slw3m4mnhxq5d6
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

```

### Example - Development with localhost DB and Mirth

```none
DEPLOYMENT_ENV="development"

APP_BASE="/new/app"
API_BASE="/new/api"

OAUTH_ISSUER=https://renalregistry.okta.com/oauth2/ausn7fa9zfh1DC2La5d6
OAUTH_AUDIENCE=api://ukrdc
APP_CLIENT_ID=****
SWAGGER_CLIENT_ID="****"

MIRTH_URL="https://host.docker.internal/api"
MIRTH_VERIFY_SSL=false
MIRTH_USER="webapi"
MIRTH_PASS="****"

UKRDC_HOST="host.docker.internal"
JTRACE_HOST="host.docker.internal"
ERRORS_HOST="host.docker.internal"

UKRDC_USER="ukrdc"
JTRACE_USER="ukrdc"
ERRORS_USER="ukrdc"

UKRDC_PASS="****"
JTRACE_PASS="****"
ERRORS_PASS="****"

SWAGGER_CLIENT_ID="****"

```
