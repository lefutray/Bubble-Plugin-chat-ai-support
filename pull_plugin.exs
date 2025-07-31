# Script para hacer pull del plugin usando PLED
Code.prepend_path("/Users/danbernal/Library/Mobile Documents/com~apple~CloudDocs/Claude/Pled/active-projects/pled-source/_build/dev/lib/pled/ebin")
Code.prepend_path("/Users/danbernal/Library/Mobile Documents/com~apple~CloudDocs/Claude/Pled/active-projects/pled-source/_build/dev/lib/req/ebin")
Code.prepend_path("/Users/danbernal/Library/Mobile Documents/com~apple~CloudDocs/Claude/Pled/active-projects/pled-source/_build/dev/lib/jason/ebin")
Code.prepend_path("/Users/danbernal/Library/Mobile Documents/com~apple~CloudDocs/Claude/Pled/active-projects/pled-source/_build/dev/lib/slugify/ebin")
Code.prepend_path("/Users/danbernal/Library/Mobile Documents/com~apple~CloudDocs/Claude/Pled/active-projects/pled-source/_build/dev/lib/finch/ebin")

# Iniciar aplicaciones necesarias
{:ok, _} = Application.ensure_all_started(:inets)
{:ok, _} = Application.ensure_all_started(:ssl)
{:ok, _} = Application.ensure_all_started(:crypto)

IO.puts("Iniciando pull del plugin...")
IO.puts("PLUGIN_ID: #{System.get_env("PLUGIN_ID")}")
IO.puts("COOKIE length: #{String.length(System.get_env("COOKIE") || "")}")

# Crear directorio src si no existe
File.mkdir_p!("src")

# Intentar hacer pull manualmente usando la API
plugin_id = System.get_env("PLUGIN_ID")
cookie = System.get_env("COOKIE")

if plugin_id && cookie do
  url = "https://bubble.io/appeditor/get_plugin?id=#{plugin_id}"
  headers = [{"cookie", cookie}, {"user-agent", "Pled/0.1.0"}]
  
  IO.puts("Haciendo request a: #{url}")
  
  case :httpc.request(:get, {String.to_charlist(url), Enum.map(headers, fn {k, v} -> {String.to_charlist(k), String.to_charlist(v)} end)}, [], []) do
    {:ok, {{_version, 200, _reason_phrase}, _headers, body}} ->
      body_string = to_string(body)
      IO.puts("Plugin obtenido exitosamente")
      
      # Parsear JSON
      case Jason.decode(body_string) do
        {:ok, plugin_data} ->
          # Guardar a archivo
          plugin_file = Path.join("src", "plugin.json")
          json_content = Jason.encode!(plugin_data, pretty: true)
          
          case File.write(plugin_file, json_content) do
            :ok ->
              IO.puts("Plugin guardado en #{plugin_file}")
              IO.puts("Tamaño: #{byte_size(json_content)} bytes")
            {:error, reason} ->
              IO.puts("Error guardando archivo: #{reason}")
          end
          
        {:error, reason} ->
          IO.puts("Error parseando JSON: #{reason}")
      end
      
    {:ok, {{_version, status, _reason_phrase}, _headers, body}} ->
      IO.puts("Error HTTP #{status}: #{to_string(body)}")
      
    {:error, reason} ->
      IO.puts("Error en request: #{inspect(reason)}")
  end
else
  IO.puts("Error: PLUGIN_ID o COOKIE no configurados")
end