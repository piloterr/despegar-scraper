<?php
// Despegar Room Offers API – PHP example (ext-curl)
// Usage: PILOTERR_API_KEY=your-key php hotel_rooms.php

$params = http_build_query([
    'query' => 'https://www.despegar.com.ar/accommodations/detail/1612020/2026-12-15/2026-12-16/2',
]);

$ch = curl_init('https://api.piloterr.com/v2/despegar/hotel/rooms?' . $params);
curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 120,
    CURLOPT_HTTPHEADER => ['x-api-key: ' . getenv('PILOTERR_API_KEY')],
]);

$body = curl_exec($ch);
$status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($status !== 200) {
    fwrite(STDERR, "Piloterr error $status: $body\n");
    exit(1);
}

$data = json_decode($body, true);
echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE), PHP_EOL;
