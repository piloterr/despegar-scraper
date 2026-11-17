#!/usr/bin/env bash
# Despegar Room Offers API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./hotel_rooms.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.piloterr.com/v2/despegar/hotel/rooms" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.despegar.com.ar/accommodations/detail/1612020/2026-12-15/2026-12-16/2
