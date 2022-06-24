#!/bin/sh
#
# THORNode Status.
#

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $(basename "${0}") [OPTIONS]

  Options:
  -h      This help output.
  -a      Node address (e.g.: thor18r4hpkhsvc7ts25gkrzu7h7q3s9n4zs6j5qfnv).
  -t      Node friendly name (e.g.: thorchain01).
EOF
  exit 1
}

#
# Status.
#
status() {
  STATUS=$(curl -s https://thornode.ninerealms.com/thorchain/node/"${1}" | jq -r .preflight_status.code)
}

#
# Run.
#
run() {
  ADDRESS="${1}"
  TAG="${2}"

  status "$ADDRESS"
  NOW=$(date -u +%s)

  curl -X POST "https://api.datadoghq.com/api/v1/series?api_key=${DD_API_KEY}" \
  -H "Content-Type: application/json" \
  -d @- << EOF
  {
    "series": [
      {
        "interval": 60,
        "tags": [
          "environment:${TAG}"
        ],
        "type": "gauge",
        "unit": "unit",
        "metric": "cosmos.thorchain.thornode.status",
        "points": [
          [
            "${NOW}",
            "${STATUS}"
          ]
        ]
      }
    ]
  }
EOF
}

while getopts ":ha:t:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    a)
      a=${OPTARG}
      ;;
    t)
      t=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${a}" ] ||
    [ -z "${t}" ]; then
  usage
fi

run "${a}" "${t}"
