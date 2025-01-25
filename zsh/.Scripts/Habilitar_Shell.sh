#!/bin/zsh
source Funciones_Compartidas.sh

#======================================
# [Funciones]
#======================================

habilitar_zsh() {

  # Inicio
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh-My-Zsh ===> Ya instalado."

    # Verificar si está configurado en el archivo .zshrc
    if grep -q "oh-my-zsh" "$HOME/.zshrc"; then
      echo "Oh My Zsh está configurado en ~/.zshrc."
    else
      echo "Oh My Zsh no está configurado en ~/.zshrc."
    fi
  else
    # Mensaje
    echo "Oh My Zsh no está instalado."
    echo "Procediendo a Instalar ....."

    # Ejecutando
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    Zsh_Plugins
  fi

  # Fin
}

Zsh_Plugins() {
  txt_color "Instalando Plugins" blue
  # you-should-use
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
}


habilitar_zsh
