# ═══════════════════════════════
# Funciones - Pequeñas
# ═══════════════════════════════

# Uso: Mensaje de Finalizacion
salir() {
  txt_color "Saliendo del programa. ¡Adiós!" green
  exit 0
}

# ═══════════════════════════════
# Funciones - Medianas
# ═══════════════════════════════
comando_instalado() {
  local comando="$1" # El comando a verificar

  if command -v "$comando" &>/dev/null; then
    echo "$comando está instalado."
    return 0 # Éxito
  else
    echo "$comando no está instalado."
    return 1 # Fallo
  fi
}

Error() {
  # Validar que se pase un mensaje
  if [ -z "$1" ]; then
    echo -e "\e[31mError: No se proporcionó ningún mensaje.\e[0m" >&2
    return 1
  fi

  local msg="$1"          # Mensaje de error
  local color="${2:-red}" # Color en inglés, por defecto rojo

  # Usar la función txt_color para manejar colores
  txt_color "Error: $msg" "$color" >&2
  return 1
}

# ═══════════════════════════════
# Funciones - Grandes
# ═══════════════════════════════
input_validador() {
  local mensaje="$1"        # Mensaje que se muestra al usuario
  local tipo="$2"           # Tipo de validación (numeros, texto, mixto)
  local validado            # Expresión regular para validar el input
  local input               # Variable para almacenar el input del usuario

  case "$tipo" in
  "numeros") validado="^[0-9]+$" ;;
  "texto") validado="^[a-zA-Z]+$" ;;
  *)
    #"Cualquier Input Valido"
    validado="^[a-zA-Z0-9]+$"
    ;;
  esac

  while true; do
    read -p "$mensaje: " input
    if [[ "$input" =~ $validado ]]; then
      break
    else
      echo "El input contiene caracteres no permitidos. Inténtalo de nuevo."
    fi
  done
  
  # Retornar el resultado como salida de la función
  echo "$input"
}

txt_color() {
  local msg="$1"   # El texto que será coloreado
  local color="$2" # El color en inglés
  local num_color  # Código de color ANSI correspondiente

  # Mapeo de colores a códigos ANSI
  case "$color" in
  "red") num_color=31 ;;
  "green") num_color=32 ;;
  "yellow") num_color=33 ;;
  "blue") num_color=34 ;;
  "magenta") num_color=35 ;;
  "cyan") num_color=36 ;;
  "white") num_color=37 ;;
  *)
    echo "Color no reconocido. Usando rojo por defecto." >&2
    num_color=31
    ;;
  esac

  # Imprimir el texto con el color seleccionado
  echo -e "\e[${num_color}m${msg}\e[0m"
}
