## Local Dotfiles

I use [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles) as the
foundation of my personal configuration. These files are the `.local`
modifications that build on top of the foundation.

## Install

~~~
git clone git@github.com:thoughtbot/dotfiles.git ~/dotfiles
git clone git@github.com:blainesch/dotfiles-local.git ~/dotfiles-local
env RCRC=$HOME/dotfiles/rcrc rcup
~~~
