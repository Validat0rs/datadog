#!/bin/sh
#
# Configure AWS.
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
  -a      Access Key ID.
  -s      Secret Access Key.
  -r      Region.
  -p      Profile.
EOF
  exit 1
}

#
# Setup.
#
setup() {
  aws_access_key_id "${1}"
  aws_secret_access_key "${2}"
  aws_region "${3}"
  aws_profile "${4}"
}

#
# Run.
#
run() {
  if [ ! -d "${HOME}"/.aws ]; then
    mkdir -p "${HOME}"/.aws
  fi

  profile=$(LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c 8)

  cat << EOF >> "${HOME}"/.aws/credentials
["${profile}"]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
EOF

  cat << EOF >> "${HOME}"/.aws/config
[profile ${AWS_PROFILE}]
source_profile = "${profile}"
region = ${AWS_REGION}
EOF
}

while getopts ":ha:s:r:p:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    a)
      a=${OPTARG}
      ;;
    s)
      s=${OPTARG}
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

if [ -z "${a}" ] ||
    [ -z "${s}" ] ||
    [ -z "${r}" ] ||
    [ -z "${p}" ]; then
  usage
fi

setup "${a}" "${s}" "${r}" "${p}"
run
