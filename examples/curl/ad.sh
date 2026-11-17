#!/usr/bin/env bash
# Despegar Hotel Ad API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./ad.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.piloterr.com/v2/despegar/ad" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.despegar.com.ar/accommodations/detail/242503/2026-12-15/2026-12-18/2
