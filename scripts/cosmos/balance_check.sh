#!/bin/sh
#
# Check balances.
#

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $(basename "${0}") [OPTIONS]

  Options:
  -h      This help output.
  -a      Wallet address.
  -r      RPC node address.
  -t      Tag prefix (to help identify the metric in DataDog).
EOF
  exit 1
}

#
# Balance.
#
balance() {
  BALANCE=$(curl -s "${2}/bank/balances/${1}" | jq -r '.result[0].amount')
}

#
# Run.
#
run() {
  ADDRESS="${1}"
  RPC="${2}"
  TAG="${3}"

  balance "${ADDRESS}" "${RPC}"
  NOW=$(date -u +%s)

  curl -X POST "https://api.datadoghq.com/api/v1/series?api_key=${DD_API_KEY}" \
  -H "Content-Type: application/json" \
  -d @- << EOF
  {
    "series": [
      {
        "tags": [
          "environment:${TAG}"
        ],
        "type": "count",
        "unit": "unit",
        "metric": "cosmos.balance_check",
        "points": [
          [
            "${NOW}",
            "${BALANCE}"
          ]
        ]
      }
    ]
  }
EOF
}

while getopts ":ha:r:t:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    a)
      a=${OPTARG}
      ;;
    r)
      r=${OPTARG}
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
    [ -z "${r}" ] ||
    [ -z "${t}" ]; then
  usage
fi

run "${a}" "${r}" "${t}"
