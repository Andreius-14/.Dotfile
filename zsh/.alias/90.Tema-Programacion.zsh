#=======================================================================================
#  Lenguajes de Programacion
#=======================================================================================

#=========
#  PHP
#=========

alias phpserver="php -S localhost:8000"

#=========
#  PY
#=========

alias pyEntorno='virtualenv venv && . venv/bin/activate'
alias pyEnter='. venv/bin/activate'
alias pyExit='deactivate'

alias pyList='pip freeze > requeriments.txt'
alias pyRestaurar='pip install -r requirements.txt'
alias pyNodemon='nodemon --exec python ' #NameFile 


#=========
#  JS
#=========

alias jsVite='pnpm create vite . && pnpm install'

alias jsNode='pnpm init && pnpm add standard -D  && jsEditJson'

function jsEditJson() {
    local config='{"type": "module", "eslintConfig": {"extends": "standard"}}'
    jq ". + $config" package.json > temp.json && mv temp.json package.json
}
#========
#  C#
#========

alias CsEntorno='dotnet new sln && dotnet new console -o Main && dotnet sln add */'
