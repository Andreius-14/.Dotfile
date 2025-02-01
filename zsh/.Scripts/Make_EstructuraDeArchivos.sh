
#!/bin/bash

# Definir la lista de carpetas
carpetas=(
  "Local-PruebaDeCodigo-Bash"
  "Local-PruebaDeCodigo-Csharp"
  "Local-PruebaDeCodigo-Css"
  "Local-PruebaDeCodigo-Git"
  "Local-PruebaDeCodigo-Js"
  "Local-PruebaDeCodigo-Lua"
  "Local-PruebaDeCodigo-Py"
  "__Archivos-Temporales"
  "__Mini_Proyectos"
  "📁 Fork"
  "📁 Librerias"
  "📁 Repositorios"
  "📁 Script"
  "📁 Sintaxis"
)

# Preguntar al usuario si desea crear las carpetas
echo "Se crearán las siguientes carpetas:"
for carpeta in "${carpetas[@]}"; do
  echo "  - $carpeta"
done

# Solicitar confirmación
while true; do
  read -p "¿Deseas continuar? (yes/no): " respuesta
  case "$respuesta" in
    [Yy]*|[Ss]*) break ;;  # Acepta "yes", "y", "s", "si"
    [Nn]*) echo "Operación cancelada."; exit 0 ;;  # Cancela si es "no", "n"
    *) echo "Por favor, responde 'yes' o 'no'." ;;
  esac
done

# Crear cada carpeta si el usuario confirma
for carpeta in "${carpetas[@]}"; do
  mkdir -p "$carpeta"
  echo "✅ Carpeta creada: $carpeta"
done

echo "🎉 Todas las carpetas han sido creadas correctamente."
