#!/bin/bash
source __FuncionesCompartidas.sh

correo="$1"
ruta="$HOME/.ssh"

cambiar-shell(){
__preguntaDeConfirmacion "¿Desea Cambiar tu SHELL a ZSH?" || return 1

__instalarPaquete zsh 

chsh -s zsh
}

creacion-De-Llave() {
  __preguntaDeConfirmacion "¿Desea Crear Llaves SSH?" || return 1

  ssh-keygen -t ed25519 -C "$correo" || ssh-keygen -t rsa -b 4096 -C "$correo"
}

paso-sshAgent() {
  if eval "$(ssh-agent -s)"; then
    txt_color "✔ Agente SSH iniciado correctamente" green
  else
    txt_color "❌ Error al iniciar el agente SSH" red
    txt_color "Ejecute manualmente uno de los siguientes comandos:" red
    txt_color "  exec ssh-agent bash" cyan
    txt_color "  exec ssh-agent zsh" cyan
    txt_color "En tu caso, el shell actual es: $SHELL" yellow
    return 1
  fi
}

verifica-Llaves-Existente() {

  local llaves=$(ls -l ~/.ssh/id_* 2>/dev/null)

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

txt_color "\nIngrese el siguiente llave a tu cuenta de Github\n" blue
cat "${ruta}/id_*.pub"
