#!/usr/bin/env bash
set -euo pipefail

WORKING_DIRECTORY=${1}
cd ${WORKING_DIRECTORY}

terraform plan -input=false -out ${BUILD_BUILDNUMBER}.tfplan
