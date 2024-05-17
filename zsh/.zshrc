# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
 # ZSH_THEME="starship"
eval "$(starship init zsh)"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
  zsh-autosuggestions
	zsh-syntax-highlighting
  colored-man-pages
  # autojump
	history
	# thefuck
  zoxide
  you-should-use
	copypath)

  fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

	# alias icat="kitty +kitten icat"

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

alias log1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias log2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)[%ar]%C(reset) %C(cyan)[%ad]%C(reset)%C(bold)%d%C(reset)  %n''          %C(dim white)%an - %ae%C(reset)%n''          %C(dim white)Mensaje: \"%s\"%C(reset)' --all"

alias glmini="git log --graph --abbrev-commit --decorate --format=format:'%C(38)%h%C(reset) - %C(255)Autor: %an%C(reset)%C(39) [%ar]%C(reset) %C(bold)%d%C(reset)%n          %C(37)Mensaje: \"%s\"%C(reset)' --all"


# alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)[%ar]%C(reset) %C(cyan)[%ad]%C(reset)%C(bold)%d%C(reset)  %n''          %C(dim white)%an - %ae%C(reset)%n''          %C(dim white)Mensaje: \"%C(reset)%C(white)%s%C(reset)%C(dim white)\"%C(reset)' --all"
# Alias taskbook
alias tb="taskbook"
alias tb+='taskbook --task'
alias tb-='taskbook -c'
alias tbclean='taskbook --clear'

# Alias Importantes
alias movil="scrcpy --always-on-top --disable-screensaver --turn-screen-off --window-borderless --window-x -1 --window-height 768"
alias note='nvim /home/carlosa/Documentos/Notas/Notas-Rapidas.txt'

# Alias Breves 
alias yt="ytfzf -t"
alias yt-audio='ytfzf -dm'

alias phpserver="php -S localhost:8000"

alias ascii-real='ascii-image-converter -Cfg --color-bg '
alias ascii1="ascii-image-converter -b -C"
alias ascii2="ascii-image-converter -b --dither -C"

alias ascii="ascii-image-converter"

alias resumen='tldr'

alias icat="kitten icat"
# EXTRA - DETALLEZ PROGRAMAS
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


alias bat="bat --paging=never --theme='Dracula'"
# EXTRA
# alias code="flatpak run com.visualstudio.code"

# alias ls="lsd"
alias file1="exa -abghHlS --tree --level=1"
alias file2="exa --icons --long --tree --level=1 -bghliS --sort=type"
alias file3="exa --icons --long --tree --level=1 -bghl --sort=type --no-filesize"
alias treefolder='tree -L 1'
alias basura='gio trash'
alias peso='dust -d 1 .'

alias apagar='sudo shutdown -h now'
# DATOS DE PRUEBA / BASURA

# export NOMBRE='ANDRES PALOMINO'
export PATH=$HOME/.cargo/bin:$PATH


# Configuracion
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# source ~/.nvm/nvm.sh

export PATH=/var/lib/snapd/snap/bin:$PATH
export PATH=$PATH:$HOME/go/bin
