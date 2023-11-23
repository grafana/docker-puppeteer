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

### Publish to Google Artifact Registry

Before, you will need gcloud CLI installed locally and authenticated to your Grafana Google account.

1. Authenticate to Docker with gcloud: 
```
gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://us-docker.pkg.dev
```
2. Build and tag your local image:
```
docker build . --tag us-docker.pkg.dev/grafanalabs-dev/grafana-ci/docker-puppeteer:latest --tag us-docker.pkg.dev/grafanalabs-dev/grafana-ci/docker-puppeteer:<VERSION>
```
3. Push the tagged image to Artifact Registry:
```
docker push us-docker.pkg.dev/grafanalabs-dev/grafana-ci/docker-puppeteer:2.0.0
docker push us-docker.pkg.dev/grafanalabs-dev/grafana-ci/docker-puppeteer:latest
```

For more information, see https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling

### [Deprecated] Publish to Docker

1. docker build . --tag grafana/docker-puppeteer:latest --tag grafana/docker-puppeteer:<VERSION>
1. docker push grafana/docker-puppeteer:latest
1. docker push grafana/docker-puppeteer:<VERSION>