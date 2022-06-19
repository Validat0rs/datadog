#!/bin/sh
#
# Check number of peers.
#

#
# Usage.
#
usage() {
  cat <<- EOF
  Usage: $(basename "${0}") [OPTIONS]

  Options:
  -h      This help output.
  -r      RPC net info URL.
EOF
  exit 1
}

#
# Number of peers.
#
num_peers() {
  PEERS=$(curl -s "${NODE}" |  jq '.result.n_peers' | xargs)
}

#
# Run.
#
run() {
  NODE="${1}"
  num_peers

  TAG=$(hostname | xargs)
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
        "unit": "node",
        "metric": "cosmos.peers",
        "points": [
          [
            "${NOW}",
            "${PEERS}"
          ]
        ]
      }
    ]
  }
EOF
}

while getopts ":hr:" opt; do
  case "${opt}" in
    h)
      usage
      ;;
    r)
      r=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${r}" ]; then
  usage
fi

run "${r}"
