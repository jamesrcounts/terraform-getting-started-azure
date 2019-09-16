#!/usr/bin/env bash
set -euo pipefail

WORKING_DIRECTORY=${1}
cd ${WORKING_DIRECTORY}

terraform apply -input=false ${BUILD_BUILDNUMBER}.tfplan