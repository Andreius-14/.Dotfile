Error() { 
  # Colores: [31: Rojo] [32: Verde] [33: Amarillo] [34: Azul] [35: Magenta] [36: Cian] [37: Blanco]
  local msm="$1"
  local num_color="${2:-31}"  # Si no se pasa un color, usa rojo por defecto (31)

  echo -e "\e[${num_color}mError: $msm\e[0m" >&2
  return 1
}


salir() {
  echo "Saliendo del programa. ¡Adiós!"
  exit 0
}
