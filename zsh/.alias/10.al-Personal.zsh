
#          ╭──────────────────────────────────────────────────────────╮
#          │                         Personal                         │
#          ╰──────────────────────────────────────────────────────────╯
ruta_today="$RUTA_VAULT/Dailies/"

journal() {
  local mes="${1:-$(date +%Y-%m)}"
  local patron="$ruta_today$mes-*.md"

  eval grep --color=always "destacable" "$patron" 2>/dev/null | \
  sed "s|.*/||" |  sed -E 's/^([^:]+):/\x1b[1;34m\1\x1b[0m:/'
}

today() {
  nvim -c "e $HOME/obsidian-temp.md" -c "Obsidian today" -c "bwipeout! $HOME/obsidian-temp.md"
}


alias zett="cd $RUTA_VAULT && today"
# alias todo="cd $RUTA_VAULT && nvim 000/*ToDo*.md"
alias todo="cd $RUTA_VAULT && find . -type f -iname '*todo*.md' -exec nvim {} +"


alias calculadora='expr'


alias wiki='wikit -l es '

#================
# [countdown]
#================
alias pomodoro="countdown 25m && sound_mk && countdown 5m && sound_mk "
alias pomodoro2="countdown 45m && sound_mk && countdown 15m && sound_mk "


#================
# [taskbook]
#================
alias tb="c && tb"
alias tb+='c && tb --task'
alias tb-='c && tb -c'
alias tbc='c && tb --clear'


