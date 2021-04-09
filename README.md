# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment, running Nginx as a reverse proxy/router.

## .env variables

An example/template .env file can be found in [.env.template](./.env.template)

### Example - Staging

```none
APP_BASE="/new/app"
API_BASE="/new/api"

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
SWAGGER_CLIENT_ID="****"

```

### Example - Staging with localhost DB and Mirth

```none
APP_BASE="/new/app"
API_BASE="/new/api"

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
