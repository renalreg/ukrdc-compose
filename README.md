# UKRDC Compose

Docker-Compose example configuration for UKRDC-TNG deployment, running Nginx as a reverse proxy/router.

## Updating deployments

This repo includes convenience scripts for updating to new releases.

Once you've published your updated container images (see below), run `./update_and_restart.sh` from within this directory on the server.

This will pull the updated images, stop, and restart the containers with the new images.

Generally, we suggest also running `docker system prune` afterwards to clean out old images from the system.

A second convenience script, `update_prune_and_log.sh`, does the update and restart, prunes unused images, and then starts showing live logs from the containers. This can be particularly useful for checking deployments are working as expected.

## Instances and Edge

While we make use of a staging environment, this has a tendency to fall out of sync with production/live. Generally then it's used as a first test, to ensure new releases deploy without errors.

Occasionally though, we implement changes significant enough that we want to test them within the production/live environment. To do this, we make use of the `edge` tag on our docker images.

Any time we run a publish action on the `ukrdc-fastapi` and `ukrdc-nuxt-3` repos, whether that's using a manual workflow dispatch, or a tag/release, the release will be tagged with `edge`.

However, _stable_ releases of the `ukrdc-fastapi` and `ukrdc-nuxt-3` repos (those which match a stable semantic version number) will also assign the `latest` tag to the release.

The nginx config here is set so that internal staff will be served the most recent `edge` tag, but external users will be served the most recent `latest` tag.

For stable releases these will be identical.

If larger changes need to be tested then, use pre-releases (e.g. `v5.2.0-beta.1` for the version numbers and tag names) - they will only be tagged with `edge`, not `latest`. Pulling and restarting this compose stack will then update the version internal staff see, without affecting external staff.

More information on versioning and release flow can be found on each individual repo:

[https://github.com/renalreg/ukrdc-fastapi](https://github.com/renalreg/ukrdc-nuxt-3?tab=readme-ov-file#application-and-api-versioning)

[https://github.com/renalreg/ukrdc-nuxt-3](https://github.com/renalreg/ukrdc-nuxt-3?tab=readme-ov-file#application-and-api-versioning)

## Environment Notes

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
