#!/usr/bin/env bash
set -euo pipefail

terraform plan \
  -input=false \
  -no-color \
  -out $(Build.BuildNumber).tfplan
