#!/usr/bin/env bash

set -eu
set -o pipefail

ARGS=('')
for a in "$@"; do
  ARGS=(${ARGS[@]} "$a")
done

cd "$(dirname $0)"

ansible-playbook \
  ${ARGS[@]} \
  playbook.yml \
