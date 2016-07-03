## Install GPG and Keybase

~~~
brew install keybase
brew install gpg
~~~

## Generate Key Pair in GPG

~~~
gpg --gen-key
~~~

## Add Secondary Email to your GPG Key

This is useful if you have a work email you also commit as.

~~~
gpg --edit-key blainesch@gmail.com
~~~

In the GPG shell:

~~~
adduid
~~~

## Export Public Key

Give your public key to Github.

~~~
gpg --armor --export blainesch@gmail.com
~~~

## Add GPG key to Keybase

This will copy your **public** key to Keybase.

~~~
keybase pgp select
~~~

## Export Private Key

I imported this into [1password](https://1password.com/features/). Skip this if you this is managed by keybase.

~~~
gpg --export-secret-key -a blainesch@gmail.com > gpg-private.key
~~~

## Import Private Key into GPG

This is useful if you have multiple computers.

~~~
gpg --allow-secret-key-import --import gpg-private.key
~~~

## Signing GIT Commits

To obtain your key (for me this was `8D515E0C`), run the following and look for
"sec:" which stands for "secret key".

You'll see it in the following format: `length/KEY creation_date`.

~~~
gpg --list-secret-keys
~~~

Then, add these lines to your `~/.gitconfig`

~~~
[user]
  signingkey = 8D515E0C
[commit]
  gpgsign = true
~~~

Or use the command line

~~~
git config --global user.signingkey 8D515E0C
git config --global commit.gpgsign true
~~~
