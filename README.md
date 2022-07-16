# .dotfiles :memo:

Yet another attempt to group boilerplate in one place to speed up new development environments

## Description

In an attempt to gain control and preserve my configuration and set up. I jumped into the wave to explore the benefits of the `dotfiles`

> Dealing with these files can be initially a journey full of clashes and frustrations in the way, but I can only remark how beneficial it is mastering and growing the content of this repository resulted.

## Migration

Make sure you have your alias configured

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Consider ignoring the container folder
```
echo ".dotfiles" >> .gitignore
```

Install config tracking in your $HOME by running:

```
curl -Lks https://github.com/threenary/.dotfiles/raw/master/.bin/dotfiles_install.sh | /bin/bash
```


## Content

### `/.bin`

File        |  Intention
------------ | -------------
[`dottfiles_init.sh`](https://github.com/threenary/.dotfiles/blob/master/.bin/dotfiles_init.sh) | Starting point that will help you create a bare repository from which start tracking your files
[`dotfiles_install.sh`](https://github.com/threenary/.dotfiles/blob/master/.bin/dotfiles_install.sh) | Assuming you have already been tracking dotfiles, this will install them in a new machine cloning the bare repository in your $HOME
[`osx_install.sh`](https://github.com/threenary/.dotfiles/blob/master/.bin/osx_install.sh) | Fresh install for a MacOS
[`Brewfile`](https://github.com/threenary/.dotfiles/blob/master/.bin/Brewfile) | Bundler to install packages, casks and Macstore apps
[`os_init.sh`](https://github.com/threenary/.dotfiles/blob/master/.bin/os_init.sh) | Missing bits that should work independently from the OS

Within this folder I encourage to contain different scripts that are handy for your day to day work. They can be contained in dedicated subfolders.


### `./aliases`

Include here the usefull aliases you might want to reference in order to be more agile.
I encourage to groupd them within domain related file. The content of this folders is intended to be downloaded to your machine within the `.dotfiles` bare repository, which later will be sourced within the `.zshrc`


## Disclaimer

:warning: It is very important that if you chose to use the files, please review the content first

## References

A lot of this was done thanks to the references and contributions gained through the following rerefences which I encourage to read:

:bookmark: [Atlassian: The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles) \
:bookmark: [OpenFolder: macOS migrations with Brewfile](https://openfolder.sh/macos-migrations-with-brewfile) \
:bookmark: [I am not myself: Your Terminal and You: Dotfiles](http://iamnotmyself.com/2020/11/10/your-terminal-and-you-dotfiles/) 

<img align="left" alt="GitHub" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.13.0/icons/github.svg"/>[
Enrico Batista da Luz](https://github.com/ricobl/dotfiles)<br>
<img align="left" alt="GitHub" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.13.0/icons/github.svg"/>[Dries De Peuter](https://github.com/NoUseFreak/dotfiles)<br>
<img align="left" alt="GitHub" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.13.0/icons/github.svg"/>[p10k](https://github.com/romkatv/powerlevel10k)
