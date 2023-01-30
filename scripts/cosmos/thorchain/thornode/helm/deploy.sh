#!/bin/sh
#
# Deploy THORChain cron pods to the k8s cluster.
#

. $(pwd)/scripts/globals.sh

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $(basename "${0}") [OPTIONS]

  Options:
  -h      This help output.
  -c      Check.
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
# Run.
#
run() {
  if [ -f $(dirname $0)/"${1}"/configmap.yml ] && [ -f $(dirname $0)/"${1}"/"${1}".yml ];
  then
    kubectl apply -f $(dirname $0)/"${1}"/configmap.yml
    kubectl apply -f $(dirname $0)/"${1}"/"${1}".yml
  fi
}

while getopts ":hc:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    c)
      c=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${c}" ]; then
  usage
fi

init
run "${c}"
