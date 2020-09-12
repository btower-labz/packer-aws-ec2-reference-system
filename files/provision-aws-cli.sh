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

# See: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

export AWSCLI2_SRC=/usr/local/src/awscli2
export AWSCLI2_URL=https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

mkdir -p ${AWSCLI2_SRC}
cd ${AWSCLI2_SRC}
curl --location --silent "${AWSCLI2_URL}" -o "${AWSCLI2_SRC}/awscliv2.zip"

ls -la awscliv2.zip
unzip awscliv2.zip
./aws/install

aws --version

cd /tmp
rm -rf ${AWSCLI2_SRC}

log 'Finished ...'
