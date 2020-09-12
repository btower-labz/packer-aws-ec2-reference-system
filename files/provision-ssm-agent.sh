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

# See: https://docs.aws.amazon.com/systems-manager/latest/userguide/agent-install-al2.html

yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

log 'Installation finished ...'

systemctl stop amazon-ssm-agent
systemctl disable amazon-ssm-agent

log 'Finished ...'
