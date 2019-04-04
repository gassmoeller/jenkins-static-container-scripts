#! /usr/bin/env sh

. ./jenkins-agent.env

set -e
set -u
set -v
set -x


docker run \
  --detach \
  --name="${JENKINS_AGENT_NAME}" \
  --restart='unless-stopped' \
  'jenkins/jnlp-slave:latest' \
    -url "https://${JENKINS_SERVER_URL}" \
    "${JENKINS_AGENT_SECRET}" \
    "$(hostname)"
