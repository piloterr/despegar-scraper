// Despegar Hotel Ad API – C# example (.NET 6+, top-level statements)
// Usage: dotnet new console -n Piloterr && copy this file to Program.cs
//        PILOTERR_API_KEY=your-key dotnet run
using System.Text.Json;

var apiKey = Environment.GetEnvironmentVariable("PILOTERR_API_KEY")
    ?? throw new InvalidOperationException("Set PILOTERR_API_KEY");

using var http = new HttpClient { Timeout = TimeSpan.FromSeconds(120) };
http.DefaultRequestHeaders.Add("x-api-key", apiKey);

var query =
    "query=" + Uri.EscapeDataString("https://www.despegar.com.ar/accommodations/detail/242503/2026-12-15/2026-12-18/2");

var response = await http.GetAsync("https://api.piloterr.com/v2/despegar/ad?" + query);
var body = await response.Content.ReadAsStringAsync();
if (!response.IsSuccessStatusCode)
{
    Console.Error.WriteLine($"Piloterr error {(int)response.StatusCode}: {body}");
    return;
}

using var doc = JsonDocument.Parse(body);
Console.WriteLine(JsonSerializer.Serialize(doc, new JsonSerializerOptions { WriteIndented = true }));
