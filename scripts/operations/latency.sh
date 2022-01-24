#!/bin/sh
#
# Check block latency.
#

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $(basename "${0}") [OPTIONS]

  Options:
  -h      This help output.
  -n      Node address.
EOF
  exit 1
}

#
# Latest block time.
#
latest_block_time() {
  LATEST_BLOCK_TIME=$(curl -s "${NODE}" | jq '.result.sync_info.latest_block_time' | sed 's/"//g' | awk -F '.' '{print $1}' |sed 's/T/ /')
}

#
# Run.
#
run() {
  NODE="${1}"
  latest_block_time

  LATEST_BLOCK_TS=$(date -u -d "${LATEST_BLOCK_TIME}" +%s)
  TAG=$(curl -s "${URL}" | jq '.result.node_info.moniker' | sed 's/"//g')
  CURRENT_TS=$(date -u +%s)

  NOW=$(date -u +%s)
  LATENCY=$(expr "${CURRENT_TS}" - "${LATEST_BLOCK_TS}")

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
        "type": "count",
        "unit": "second",
        "metric": "cosmos.rpc.block_latency",
        "points": [
          [
            "${NOW}",
            "${LATENCY}"
          ]
        ]
      }
    ]
  }
EOF
}

while getopts ":hn:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    n)
      n=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${n}" ]; then
  usage
fi

run "${n}"
