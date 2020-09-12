#!/usr/bin/env bash

set -o nounset
set -o noclobber
set -o errexit
set -o pipefail

# TODO: disable service after provision is done

BASENAME=$(basename "${0}")
function log {
  local MESSAGE=${1}
  echo "${BASENAME}: ${MESSAGE}"
  logger --id "${BASENAME}: ${MESSAGE}"
}

log 'Started ...'

# See: https://docs.aws.amazon.com/inspector/latest/userguide/inspector_installing-uninstalling-agents.html

export INSPECTOR_SRC=/usr/local/src/inspector
export INSPECTOR_URL=https://inspector-agent.amazonaws.com/linux/latest/install

mkdir -p ${INSPECTOR_SRC}
cd ${INSPECTOR_SRC}
curl --silent --location -O ${INSPECTOR_URL}
bash install

# TODO: Verify signatore
#See: https://docs.aws.amazon.com/inspector/latest/userguide/inspector_verify-sig-agent-download-linux.html

cd /tmp
rm -rf ${INSPECTOR_SRC}

log 'Finished ...'
