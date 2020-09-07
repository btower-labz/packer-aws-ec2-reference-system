#!/usr/bin/env bash

set -o nounset
set -o noclobber
set -o errexit
set -o pipefail

BASENAME=$(basename "${0}")
function log {
  local MESSAGE=${1}
  echo "${BASENAME}: ${MESSAGE}"
  logger --id "${BASENAME}: ${MESSAGE}"
}

log 'Started ...'

cd /tmp
curl --location --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
ls -la awscliv2.zip
unzip awscliv2.zip
./aws/install
aws --version
rm -f awscliv2.zip
rm -rf /tmp/aws

log 'Finished ...'
