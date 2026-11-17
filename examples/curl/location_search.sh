#!/usr/bin/env bash
# Despegar Location Search API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./location_search.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.piloterr.com/v2/despegar/location/search" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode 'query=Buenos Aires'
