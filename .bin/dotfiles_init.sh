#!/usr/bin/env zsh

create_repo(){
    git init --bare $HOME/.$1
    alias $2="/usr/bin/git --git-dir=$HOME/.$1/ --work-tree=$HOME"
    dotfiles config --local status.showUntrackedFiles no
    echo "alias $2='/usr/bin/git --git-dir=$HOME/.$1/ --work-tree=$HOME'" >> $HOME/.zshrc
}

printf "This will set up a tracking repository for your dotfiles \n"
printf "###################################################### \n"
echo 
echo "Enter repository name: "
read folder
echo "Enter alias for interaction: "
read alias
echo
printf "The following folder setup will be created \n"
echo "Repository folder: .$folder"
echo "Git alias: $alias \n"

echo "Do you wish to continue?"
select yn in "Yes" "No"
case $yn in
    Yes ) 
        create_repo $folder $alias
        exit;;
    No ) exit;;
esac
