# Script simple para encode usando solo bibliotecas estándar
Mix.install([{:jason, "~> 1.4"}])

IO.puts("Iniciando encode del plugin...")

# Verificar que existe src/
if not File.exists?("src/") do
  IO.puts("Error: No existe directorio src/")
  System.halt(1)
end

# Crear directorio dist
File.mkdir_p!("dist")

# Leer plugin.json base
src_json = "src/plugin.json" |> File.read!() |> Jason.decode!()

IO.puts("Plugin base cargado: #{src_json["human"]}")

# Procesar elementos
elements_dir = "src/elements"
plugin_elements = if File.exists?(elements_dir) do
  elements_dir
  |> File.ls!()
  |> Enum.filter(fn dir -> File.dir?(Path.join(elements_dir, dir)) end)
  |> Enum.reduce(%{}, fn element_dir, acc ->
    element_path = Path.join(elements_dir, element_dir)
    
    # Leer la key del elemento
    key_file = Path.join(element_path, ".key")
    if File.exists?(key_file) do
      key = File.read!(key_file) |> String.trim()
      
      # Leer JSON del elemento
      json_file = Path.join(element_path, "#{key}.json")
      if File.exists?(json_file) do
        element_data = File.read!(json_file) |> Jason.decode!()
        
        # Cargar código JavaScript
        element_data = ["initialize", "update", "preview", "reset"]
        |> Enum.reduce(element_data, fn func, acc ->
          js_file = Path.join(element_path, "#{func}.js")
          if File.exists?(js_file) do
            code = File.read!(js_file)
            # Wrap code in function
            wrapped_code = "function(instance, properties, context) {\n#{code}\n}"
            put_in(acc, ["code", func, "fn"], wrapped_code)
          else
            acc
          end
        end)
        
        IO.puts("Elemento procesado: #{element_data["display"]} (#{key})")
        Map.put(acc, key, element_data)
      else
        acc
      end
    else
      acc
    end
  end)
else
  %{}
end

# Procesar categorías al formato correcto de Bubble
processed_json = case get_in(src_json, ["meta_data", "categories"]) do
  categories when is_list(categories) ->
    # Convertir array a objeto con índices
    categories_object = categories
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {category, index}, acc ->
      Map.put(acc, to_string(index), category)
    end)
    
    put_in(src_json, ["meta_data", "categories"], categories_object)
  
  _ ->
    # Ya está en formato correcto o no hay categorías
    src_json
end

# Combinar todo
final_json = Map.put(processed_json, "plugin_elements", plugin_elements)

# Escribir resultado
output_json = Jason.encode!(final_json, pretty: true)
File.write!("dist/plugin.json", output_json)

IO.puts("✅ Plugin codificado exitosamente!")
IO.puts("📁 Archivo generado: dist/plugin.json")
IO.puts("📊 Tamaño: #{byte_size(output_json)} bytes")
IO.puts("🎯 Elementos incluidos: #{map_size(plugin_elements)}")

# Mostrar categorías
categories = get_in(final_json, ["meta_data", "categories"])
if categories && map_size(categories) > 0 do
  IO.puts("📂 Categorías: #{categories |> Map.values() |> Enum.join(", ")}")
end

if map_size(plugin_elements) > 0 do
  IO.puts("\n📋 Elementos procesados:")
  Enum.each(plugin_elements, fn {key, element} ->
    IO.puts("  - #{element["display"]} (#{key})")
  end)
end