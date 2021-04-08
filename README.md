# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment, running Traefik as a reverse proxy/router.

## Traefik proxy port

The `docker-compose` file here binds Traefik to port 9999. This can be easily reconfigured to use ports 80 and 443 if this will be the main public-facing proxy. Port 9999 is used in the example to allow a proxy further downstream providing SSL termination.

In this configuration, the Traefik proxy exists only to provide a dashboard and routing to get the entire stack up and running.

### Enabling SSL

- To `api`, add the label:
  - `- "traefik.http.routers.fastapi.entrypoints=websecure`
- To `app`, add the label:
  - `- "traefik.http.routers.nuxt.entrypoints=websecure`
- To `proxy`, remove the command:
  - `- --entrypoints.web.address=:9999`
- To `proxy`, add the commands:
  - `- --entrypoints.web.address=:80`
  - `- --entrypoints.websecure.address=:443`
- To `proxy`, enable ports:
  - `- "8080:8080"`
  - `- "80:80"`
  - `- "443:443"`

## .env variables

### Example - Staging + Port Forwarding

```none
MIRTH_URL="http://host.docker.internal:9004"
UKRDC_HOST="host.docker.internal"
JTRACE_HOST="host.docker.internal"

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
ERRORS_HOST="staging-db.ukrdc.nhs.uk"

UKRDC_USER="ukrdc"
JTRACE_USER="ukrdc"
ERRORS_USER="ukrdc"

UKRDC_PASS="****"
JTRACE_PASS="****"
ERRORS_PASS="****"

```
