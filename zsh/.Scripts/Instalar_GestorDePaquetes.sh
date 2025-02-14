#!/bin/zsh
source __FuncionesCompartidas.sh

local array=(
  yay         # AUR Helper
  npm         # Node.js Package Manager
  pnpm        # Alternativa más eficiente a npm
  python-pip  # Gestor de paquetes de Python
  python-pipx # Para instalar herramientas Python en entornos aislados

)

# ═══════════════════════════════
#           Funciones
# ═══════════════════════════════

homeBrew() {

  __EstaInstalado brew && return 0    # Verificar [True/false]

  # Instalar Paquete
  txt_color "⏳ Instalando $gestor..." green
  sudo pacman -S --needed base-devel
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  source ~/.zshrc


  __EstaInstalado brew                # Verificar [True/false]
}

# ═══════════════════════════════
#             Main
# ═══════════════════════════════

main() {
  homeBrew

  for gestor in "${array[@]}"; do
    if __EstaInstalado "$gestor"; then
      continue # Evita instalación innecesaria
    fi

    txt_color "⏳ Instalando $gestor..." green
    sudo pacman -S --needed --noconfirm "$gestor"
  done
}

main
