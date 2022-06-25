#!/bin/sh
#
# Check IBC balances.
#

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $(basename "${0}") [OPTIONS]

  Options:
  -h      This help output.
  -a      API node address.
  -w      Wallet address.
  -p      Project relaying for (e.g.: cosmoshub).
  -t      Tag prefix (to help identify the metric in DataDog).
EOF
  exit 1
}

#
# Balance.
#
balance() {
  BALANCE=$(curl -s "${1}/bank/balances/${2}" | jq -r '.result[0].amount')
}

#
# Run.
#
run() {
  NODE_ADDRESS="${1}"
  WALLET_ADDRESS="${2}"
  PROJECT_NAME="${3}"
  TAG="${4}"

  balance "${NODE_ADDRESS}" "${WALLET_ADDRESS}"
  NOW=$(date -u +%s)

  curl -X POST "https://api.datadoghq.com/api/v1/series?api_key=${DD_API_KEY}" \
  -H "Content-Type: application/json" \
  -d @- << EOF
  {
    "series": [
      {
        "interval": 60,
        "tags": [
          "environment:${TAG}",
          "project:${PROJECT_NAME}"
        ],
        "type": "gauge",
        "unit": "unit",
        "metric": "cosmos.ibc.balance_check",
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

while getopts ":ha:w:p:t:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    a)
      a=${OPTARG}
      ;;
    w)
      w=${OPTARG}
      ;;
    p)
      p=${OPTARG}
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
    [ -z "${w}" ] ||
    [ -z "${p}" ] ||
    [ -z "${t}" ]; then
  usage
fi

run "${a}" "${w}" "${p}" "${t}"
