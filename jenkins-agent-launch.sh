#! /usr/bin/env sh

source jenkins.env

set -e
set -v
set -x


docker run \
  --detach \
  --name="${JENKINS_AGENT_NAME}" \
  --restart='unless-stopped' \
  'jenkins/jnlp-slave:lts' \
    -url "${JENKINS_URL}:50000" \
    "${JENKINS_AGENT_SECRET}" \
    "$(hostname)"
