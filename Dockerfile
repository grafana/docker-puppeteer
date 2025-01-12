# A minimal Docker image with Node, Puppeteer and Pa11y-CI
#
# Initially based upon:
# https://github.com/buildkite/docker-puppeteer

FROM --platform=linux/amd64 node:20.9.0-buster-slim@sha256:ec8072f0dc866129eddca290422a3fa77770f17190c2e79d4e65af264eee15b4

RUN  apt-get update \
     && apt-get install -y wget gnupg ca-certificates procps libxss1 \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
     && apt-get update \
     # We install Chrome to get all the OS level dependencies, but Chrome itself
     # is not actually used as it's packaged in the node puppeteer library.
     # Alternatively, we could could include the entire dep list ourselves
     # (https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix)
     # but that seems too easy to get out of date.
     && apt-get install -y google-chrome-stable \
     && rm -rf /var/lib/apt/lists/* \
     && wget --quiet https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/sbin/wait-for-it.sh \
     && chmod +x /usr/sbin/wait-for-it.sh

# Install Puppeteer under /node_modules so it's available system-wide
ADD package.json yarn.lock /
RUN yarn install

RUN yarn global add \
        pa11y-ci@3.0.1 \
        depcheck \
        --unsafe-perm \
    && yarn cache clean