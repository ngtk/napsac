#!/usr/bin/env bash

set -eu
set -o pipefail

ARGS=('')
for a in "$@"; do
  ARGS=(${ARGS[@]} "$a")
done

cd "$(dirname $0)"

ansible-playbook \
  -i 'localhost' \
  --extra-vars='@config.yml' \
  ${ARGS[@]} \
  playbook.yml \
