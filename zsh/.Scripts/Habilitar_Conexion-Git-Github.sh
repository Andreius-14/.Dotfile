#!/bin/bash
source __FuncionesCompartidas.sh

correo=$(input_validador "Ingrese Su Correo Para Ejecutar el Script" email)
ruta="$HOME/.ssh"

laShell=$(basename $SHELL 2>/dev/null)

cambiar-shell() {
  __preguntaDeConfirmacion "¿Desea cambiar Tu Shell de $laShell a Zsh?" || return 1
  __instalarPaquete zsh
  chsh -s zsh
  laShell="zsh"
}

creacion-De-Llave() {
  __preguntaDeConfirmacion "¿Crear Llaves SSH?" || return 1
  ssh-keygen -t ed25519 -C "$correo" || ssh-keygen -t rsa -b 4096 -C "$correo"

}

paso-sshAgent() {
  verifica-Llaves-Existente

  txt_color "\nEl Archivo Puede Ser [id_ed25519 o id_rsa] (No lleva .pub)" green
  local fileName=$(__seleccionar_archivo $ruta)

  if eval "$(ssh-agent -s)"; then
    txt_color "✔ Agente SSH iniciado correctamente" green
  else
    exec ssh-agent $laShell
  fi

  ssh-add $ruta/$fileName
}

verifica-Llaves-Existente() {

  local llaves=$(ls $ruta/id_* 2>/dev/null)
  txt_color "\n🔑 Las llaves SSH disponibles son:" blue

  if [[ -n "$llaves" ]]; then
    txt_color "$llaves" red
    return 0
  else
    txt_color ">>>> Sin llaves encontradas <<<<" red
    return 1
  fi
}

# ═══════════════════════════════
#         Main
# ═══════════════════════════════

cambiar-shell
verifica-Llaves-Existente || creacion-De-Llave
paso-sshAgent

txt_color "\nIngrese el siguiente llave a tu cuenta de Github\n" blue
cat $ruta/id_*.pub
