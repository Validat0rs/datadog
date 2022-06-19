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
  -t      Tag prefix (to help identify the metric in DataDog).
EOF
  exit 1
}

#
# Balance.
#
balance() {
  BALANCE=$(curl -s "https://api.ethplorer.io/getAddressInfo/${1}?apiKey=freekey" | jq -r .ETH.balance)
}

#
# Run.
#
run() {
  ADDRESS="${1}"
  TAG="${2}"

  balance "$ADDRESS"
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
        "metric": "ethereum.balance_check",
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
