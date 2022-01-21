#!/bin/sh
#
# Deploy DataDog to a k8s cluster.
#

. $(pwd)/scripts/globals.sh

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $0 [OPTIONS]

  Options:
  -h      This help output.
  -a      The DataDog API key.

EOF
  exit 1
}

#
# Init.
#
init() {
  helm_installed
}

#
# Setup
#
setup() {
  helm repo add datadog https://helm.datadoghq.com &>/dev/null
}

#
# Run.
#
run() {
  helm upgrade --install -n monitoring --create-namespace \
  -f helm/datadog/values.yaml \
  --set datadog.site='datadoghq.com' \
  --set datadog.apiKey="${1}" \
  datadog-agent datadog/datadog
}

while getopts ":ha:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    a)
      a=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${a}" ]; then
  usage
fi

init
setup
run "${a}"
