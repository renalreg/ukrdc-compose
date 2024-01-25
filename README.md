# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment, running Nginx as a reverse proxy/router.

## Deployment guide

See our [internal Confluence documentation](https://renalregistry.atlassian.net/wiki/spaces/UDF/pages/2516680711/Releases+and+Deployment) for up-to-date guidelines on versioning, releases, and deployment.

## Deployment notes

### IP-based tag routing

The nginx template at `templates/default.conf.template` defines how traffic should be routed to different containers. As it currently stands, internal UKKA traffic is routed to the container running the most recent `edge` tagged image, and all other traffic routes to the most recent `latest` tagged image.

To change the IP ranges routed to `edge`, modify the two `geo $remote_addr` blocks in `templates/default.conf.template`.

### Redis edge

Because task management must be specific to each deployment (`latest` and `edge`), we need to create separate Redis instances for each. This has the unfortunate side effect of doubling the amount of work done to update stats for example, but has the advantage in allowing us to internally test new methods of calculating and caching data with Redis (including new stats methods) without affecting external users.

## Environment notes

### `fastapi.environment.FORWARDED_ALLOW_IPS`

Uvicorn uses `FORWARDED_ALLOW_IPS` to determine which proxy IPs are allowed to access the server.

We cannot resolve the proxy IP at runtime, and since it's unknown until the container is running.
However, we set up our compose stack such that the API host is only ever accessed via it's internal IP address. All external connections are blocked (no exposed ports), and all traffic comes in via the `nginx` reverse proxy. Therefore, we set `FORWARDED_ALLOW_IPS` to allow all IP's to get around this issue.

### `fastapi.environment.ALLOW_ORIGINS`

While we have the option to specify allowed origins for the API, we don't need to do this in production since the UI is served on the same origin under a different path, behind the `nginx` reverse proxy.

## Example environment

### Staging

```none

# API

WOTD='["Staging server for testing purposes only."]'

SWAGGER_CLIENT_ID="0oan75eooLX2DcdQK5d6"

MIRTH_URL="https://staging-mirth.ukrdc.nhs.uk/api"
MIRTH_VERIFY_SSL=false
MIRTH_USER="webapi"
MIRTH_PASS="****"

UKRDC_HOST="10.6.145.83"
JTRACE_HOST="10.6.145.83"
ERRORS_HOST="10.6.145.83"
STATS_HOST="10.6.145.83"
AUDIT_HOST="10.6.145.83"

UKRDC_USER="ukrdc"
JTRACE_USER="ukrdc"
ERRORS_USER="ukrdc"
STATS_USER="ukrdc"
AUDIT_USER="ukrdc"

UKRDC_PASS="****"
JTRACE_PASS="****"
ERRORS_PASS="****"
STATS_PASS="****"
AUDIT_PASS="****"

# App

APP_CLIENT_ID=0oan98slw3m4mnhxq5d6

# Common

DEPLOYMENT_ENV="staging"
OAUTH_ISSUER=https://renalregistry.okta.com/oauth2/ausn7fa9zfh1DC2La5d6

```
