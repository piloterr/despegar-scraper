#!/usr/bin/env bash
# Despegar Flight Search API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./flight_search.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.piloterr.com/v2/despegar/flight/search" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=BUE-MAD
