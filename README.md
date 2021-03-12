# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment

## .env variables

### Example - Staging + Port Forwarding

```none
MIRTH_URL="http://localhost:9004"
UKRDC_HOST="localhost"
JTRACE_HOST="localhost"

UKRDC_USER="ukrdc"
JTRACE_USER="ukrdc"
ERRORS_USER="ukrdc"

UKRDC_PASS="****"
JTRACE_PASS="****"
ERRORS_PASS="****"

```

### Example - Staging

```none
MIRTH_URL="http://staging-mirth.ukrdc.nhs.uk"
UKRDC_HOST="staging-db.ukrdc.nhs.uk"
JTRACE_HOST="staging-db.ukrdc.nhs.uk"

UKRDC_USER="ukrdc"
JTRACE_USER="ukrdc"
ERRORS_USER="ukrdc"

UKRDC_PASS="****"
JTRACE_PASS="****"
ERRORS_PASS="****"

```
