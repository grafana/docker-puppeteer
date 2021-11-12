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

1. docker build . --tag hugohaggmark/docker-puppeteer:latest --tag hugohaggmark/docker-puppeteer:<VERSION>
2. docker push hugohaggmark/docker-puppeteer:latest hugohaggmark/docker-puppeteer:<VERSION>
3. docker push hugohaggmark/docker-puppeteer:<VERSION>
4. There is no step 4.
