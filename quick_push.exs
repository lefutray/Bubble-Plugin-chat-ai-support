# Script rápido para push con nueva cookie
Mix.install([{:jason, "~> 1.4"}])

Application.ensure_all_started(:inets)
Application.ensure_all_started(:ssl)
Application.ensure_all_started(:crypto)

plugin_id = System.get_env("PLUGIN_ID")
cookie = System.get_env("COOKIE")

# Leer plugin
content = File.read!("dist/plugin.json")
plugin_data = Jason.decode!(content)

IO.puts("🚀 Subiendo '#{plugin_data["human"]}' con #{map_size(plugin_data["plugin_elements"] || %{})} elementos...")

# Request simplificado
url = ~c"https://bubble.io/appeditor/save_plugin"
headers = [
  {~c"cookie", String.to_charlist(cookie)},
  {~c"content-type", ~c"application/json"}
]

body = Jason.encode!(%{"id" => plugin_id, "raw" => plugin_data})

case :httpc.request(:post, {url, headers, ~c"application/json", String.to_charlist(body)}, [{:timeout, 60000}], []) do
  {:ok, {{_, 200, _}, _, response}} ->
    IO.puts("✅ ÉXITO! Plugin subido correctamente")
    
  {:ok, {{_, status, _}, _, response}} ->
    IO.puts("❌ Error HTTP #{status}: #{response}")
    
  {:error, {:timeout, _}} ->
    IO.puts("⏰ Timeout - pero puede haberse subido, verifica en Bubble")
    
  {:error, reason} ->
    IO.puts("❌ Error: #{inspect(reason)}")
end