ZSH_THEME="avit"
export PATH="$HOME/.bin:$PATH"

alias ls="exa"

setnvm() {
 if [ "$PWD" != "$MYOLDPWD" ]; then
   MYOLDPWD="$PWD";
   if [ -e "$PWD/.nvmrc" ]; then
     nvm use
   fi
 fi
}
function cd () { builtin cd "$@" && setnvm; }

plugins=(rbenv nvm autojump)
