ZSH_THEME="avit"
export PATH="$HOME/.bin:$PATH"
export ZSH=~/.oh-my-zsh

setnvm() {
 if [ "$PWD" != "$MYOLDPWD" ]; then
   MYOLDPWD="$PWD";
   if [ -e "$PWD/.nvmrc" ]; then
     nvm use
   elif [ -e "$PWD/.node-version" ]; then
     nvm use $(cat $PWD/.node-version)
   fi
 fi
}
function cd () { builtin cd "$@" && setnvm; }

plugins=(rbenv nvm autojump)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.zshrc.env ]] && source ~/.zshrc.env
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# Link neovim
#ln -sf ~/.vim ~/.config/nvim
#ln -sf ~/.vimrc ~/.vim/init.vim
#alias vim="nvim"
