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

yum --assumeyes updateinfo || true
uname -mrs
yum --assumeyes check-update || true
yum --assumeyes update || true

log 'Finished ...'
