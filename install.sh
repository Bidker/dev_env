#!bin/bash

COLOR='\033[1;36m'
NC='\033[0m'

printf "${COLOR}Install tmux and neovim\n ${NC}"
sudo apt-get install -y tmux neovim

printf "\n${COLOR}Do you want install spotify? I'm need this for tmux configuration [Y/n]? ${NC}"
read -r -p "" response
if [[ "$response" =~ ^([yY])$ ]]
then
    printf "\n${COLOR}Install spotify and spotify client for linux ${NC}\n"
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
    python3 -m pip install spotify-cli-linux
fi

printf "\n${COLOR}Remove original file init.vim, .tmux.conf and .bash_aliases ${NC}"
rm ~/.config/nvim/init.vim ~/.bash_aliases ~/.tmux.conf

printf "\n${COLOR}Create sybolic link for init.vim, .tmux.con and .bash_aliases ${NC}"
ln -s ~/rcfile/init.vim ~/.config/nvim/init.vim
ln -s ~/rcfile/.bash_aliases ~/.bash_aliases
ln -s ~/rcfile/.tmux.conf ~/.tmux.conf

printf "\n${COLOR}Install plugins for tmux and neovim ${NC} \n"
~/.tmux/plugins/tpm/bin/install_plugins
nvim +PlugInstall +qall

printf "\n${COLOR}Source .bashrc ${NC} \n"
source ~/.bashrc

printf "\n${COLOR}Done! Enjoy! ${NC} \n\n"
