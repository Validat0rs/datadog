#!/bin/sh
#
# Check Sommelier Ethereum signer balance.
#

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $(basename "${0}") [OPTIONS]

  Options:
  -h      This help output.
  -a      Ethplorer API Key.
  -w      Wallet address.
  -t      Tag prefix (to help identify the metric in DataDog).
EOF
  exit 1
}

#
# Balance.
#
balance() {
  BALANCE=$(curl -s "https://api.ethplorer.io/getAddressInfo/${1}?apiKey=${2}" | jq -r .ETH.balance)
}

#
# Run.
#
run() {
  API_KEY="${1}"
  ADDRESS="${2}"
  TAG="${3}"

  balance "${ADDRESS}" "${API_KEY}"
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
        "metric": "ethereum.sommelier.signer.balance_check",
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

while getopts ":ha:w:t:" opt; do
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
    [ -z "${t}" ]; then
  usage
fi

run "${a}" "${w}" "${t}"
