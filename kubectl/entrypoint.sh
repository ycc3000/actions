#!/bin/sh

set -e

if [ -z "$INPUT_KUBECONFIG_BASE64DATA" ]; then
  echo '::error::Required kubeconfig_base64data parameter'
  exit 1
fi

echo "$INPUT_KUBECONFIG_BASE64DATA" | base64 -d > ./config
export KUBECONFIG=./config

sh -c "kubectl $*"

if [ -n "$INPUT_RUN" ]; then
  sh -c "$INPUT_RUN"
fi

echo "Kubernetes CLI - kubectl successfully"