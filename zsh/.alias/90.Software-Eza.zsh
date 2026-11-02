#================
#     [Eza]
#================
#--group-directories-first
alias eza='eza --color=always --icons=always '
# --group-directories-first
#

# hide=(--no-permissions --no-filesize --no-user no-time)

flag_No="--no-permissions --no-filesize --no-user --no-time  "
flag_No_time="--no-permissions --no-filesize --no-user"
flag_NoPeso="--no-permissions               --no-user --no-time"

# flag_eza_
flag_eza_git=" -lh  $flag_No   --git --git-repos "
flag_eza_peso=" -lh  $flag_NoPeso  --total-size -S "
flag_eza_time="-lh  -Umu --changed"

# ==> Original
# @Acepta parametros y admite N° OPCIONAL TREE
arbol() {
    local nivel=1
    # Existe? Es número? . # Descarta Caja-1 ($1) 
    if [[ $# -gt 0 && "$1" =~ ^[0-9]+$ ]]; then
        nivel="$1";
        shift  
    fi
    eza -TL "$nivel" "$@"
}
arbol_peso() {
    local nivel=1
    if [[ $# -gt 0 && "$1" =~ ^[0-9]+$ ]]; then
        nivel="$1";
        shift  
    fi
    eval "eza -TL $nivel  $flag_eza_peso  $@"
}
arbol_git() {
    local nivel=1
    if [[ $# -gt 0 && "$1" =~ ^[0-9]+$ ]]; then
        nivel="$1";
        shift  
    fi
    eval "eza  -TL $nivel $flag_eza_git $@"
    
}

# ==> Abreviatura
t(){ arbol "$@"}
tp(){ arbol_peso "$@"}
tg(){ arbol_git "$@"}

alias t1='t 1 '   # Default nivel 1 via función
alias t2='t 2 '   # Fuerza nivel 2
alias t3='t 3 '   # Fuerza nivel 3


ft(){ eval "t${1:-1} $flag_eza_time --time-style=relative ${@:2}" }
ft2(){ eval "t${1:-1} $flag_eza_time --time-style=default ${@:2}" }
ft3(){ eval "t${1:-1} $flag_eza_time --time-style=long-iso ${@:2}" }
ft4(){ eval "t${1:-1} $flag_eza_time --time-style=full-iso ${@:2}" }

# ${1:-1}

alias ta="t -lh -g -Hio "
alias tan="t -lh -gn -io -HS"
alias tat="t -lh $flag_No_time -muU --changed --sort=time"
alias tatn="t -lh $flag_No_time -muU --changed --sort=time --time-style=relative"

# (Grupo) -g group  [-n Id DE Grupo]  [--smart-group]

# === Columnas ===
# -H link
# -i inode
# -o octal persmisos

# === Columnas Peso === 
# (Peso) --total-size  [-b binario] [-B bytes]  
# (Peso) -S Blocksize

# === Columnas Time ===
# (time) -t (modified, created, accessed)  
# (Time) -U [created]
# (Time) -m [modified] [default]
# (Time) -u [accessed]
# (Time) --changed
# (Time) --time-style


