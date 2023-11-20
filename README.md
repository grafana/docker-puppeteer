# Grafana Docker Puppeteer

## Description

A minimal Docker image with Node, Puppeteer and Pa11y-CI

Initially based upon:
https://github.com/buildkite/docker-puppeteer

## Versions

See the list of [Docker Hub tags](https://hub.docker.com/repository/registry-1.docker.io/hugohaggmark/docker-puppeteer/tags/) for versions available.

## Example

See the [example directory](example) for a complete Docker Compose example, showing how to run Puppeteer against a linked Docker Compose web service.

## Releasing

1. docker build . --tag grafana/docker-puppeteer:latest --tag grafana/docker-puppeteer:<VERSION>
2. docker push grafana/docker-puppeteer:latest grafana/docker-puppeteer:<VERSION>
3. docker push grafana/docker-puppeteer:<VERSION>
4. There is no step 4.

Image is now published to GCR - Google Artifact Registry

Before, You will need gcloud CLI installed locally, and authenticated to your Grafana Google account.

1. Request "timed access"
2. Authenticate to Docker with gcloud: `gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://us-docker.pkg.dev`
