#          ╭──────────────────────────────────────────────────────────╮
#          │                            UX                            │
#          ╰──────────────────────────────────────────────────────────╯

alias q="exit"
alias c="clear"

alias copiar='xclip -sel clip'
alias basura='gio trash'
alias open='xdg-open'


alias mkdir='mkdir -pv'  

alias resumen='tldr'

#=============================
# RIESGO
#=============================
alias apagar='sudo shutdown -h now'
alias windows='sudo grub-reboot 1 && read -p "Presiona Enter para reiniciar..." && reboot' #sudo grep ^menuentry /boot/grub/grub.cfg


#=============================
# DISTROS
#=============================

alias i='sudo pacman --asexplicit -S | sudo apt install' 
alias update='sudo pacman -Syu'


#=============================
# INFORMACION
#=============================
alias wifi='nmcli device wifi list'
alias i-kernel='figlet $(uname -r) | lolcat '

#          ╭──────────────────────────────────────────────────────────╮
#          │                            UI                            │
#          ╰──────────────────────────────────────────────────────────╯

alias peso='dust -d 1 .'
alias peso1="du -sh ./* | sort -rh"

alias bat="bat --paging=never --theme='Dracula'"


alias nvimf='nvim "$(fzf)"'
alias sudonvim='sudo HOME=$HOME XDG_CONFIG_HOME=$XDG_CONFIG_HOME nvim'
alias snvim='sudo XDG_CONFIG_HOME=$HOME/.config HOME=$HOME nvim'

info_Comandos-mas-usados(){

history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
echo -e "\nGraficos: \n"
history | tr -s ' ' | cut -d ' ' -f3 | sort | uniq -c | sort -n | tail | perl -lane 'print $F[1], "\t", $F[0], " ", "▄" x ($F[0] / 12)' 

}

#=============================
# PRODUCTIVIDAD
#=============================

# alias leer='speak-ng -ves '
#================
# [Basura]
#================
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
# alias code="flatpak run com.visualstudio.code"
# alias treefolder='tree -L 1'

