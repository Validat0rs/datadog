#!/bin/sh
#
# Generate kube config.
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
  -c      Cluster.
  -r      Region.
  -p      Profile.
EOF
  exit 1
}

#
# Initialize.
#
init() {
  awscli_installed
}

#
# Setup.
#
setup() {
  cluster_name "${1}"
  aws_region "${2}"
  aws_profile "${3}"
}

#
# Run.
#
run() {
  unset KUBECONFIG
  aws eks update-kubeconfig --name "${CLUSTER_NAME}" --region "${AWS_REGION}" --profile "${AWS_PROFILE}"
}

while getopts ":hc:r:p:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    c)
      c=${OPTARG}
      ;;
    r)
      r=${OPTARG}
      ;;
    p)
      p=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${c}" ] ||
    [ -z "${r}" ]; then
  usage
fi

init
setup "${c}" "${r}" "${p}"
run
