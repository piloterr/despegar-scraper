// Despegar Room Offers API – Node.js example (Node 18+, native fetch, ES module)
// Usage: PILOTERR_API_KEY=your-key node hotel_rooms.mjs

const params = new URLSearchParams({
  "query": "https://www.despegar.com.ar/accommodations/detail/1612020/2026-12-15/2026-12-16/2",
});

const response = await fetch(`https://api.piloterr.com/v2/despegar/hotel/rooms?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY },
  signal: AbortSignal.timeout(120_000),
});

if (!response.ok) {
  console.error(`Piloterr error ${response.status}: ${await response.text()}`);
  process.exit(1);
}

console.log(JSON.stringify(await response.json(), null, 2));
