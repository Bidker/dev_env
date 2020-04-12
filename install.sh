#!bin/bash

COLOR='\033[1;36m'
NC='\033[0m'

install_dbeaver='y'
install_spotify='y'

printf "${COLOR}Install tmux and neovim\n ${NC}"
sudo apt-get install -y tmux neovim

printf "\n${COLOR}Do you want full dev enviroment (include DBeaver and Spotify)? ${NC}"
read -r -p "possible answer: y- [Y]es, n- [N]o, s- i want [S]elect" response
if [[ "$response" =~ ^([nN])$ ]]
then
    install_dbeaver='n'
    install_spotify='n'
elif [[ "$response" =~ ^([sS]) ]]
then
    printf "\n${COLOR}Do you want install DBeaver? (project site: https://dbeaver.io/) [Y/n]${NC}"
    read -r -p "" install_dbeaver
    printf "\n${COLOR}Do you want install Spotify? (project site: https://www.spotify.com/) [Y/n]${NC}"
    read -r -p "" install_spotify
fi

if [[ "$install_dbeaver" != 'n' || "$install_dbeaver" != 'N']]
then
    printf "\n${COLOR}Install DBeaver${NC}\n"
    wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
    echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
    sudo apt update
    sudo apt -y  install dbeaver-ce
fi

if [[ "$install_spotify" != 'n' || "$install_spotify" != 'N']]
then
    printf "\n${COLOR}Install spotify and spotify client for linux ${NC}\n"
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
fi

printf "\n${COLOR}Create folders for fonts and i copy font from repository to new folder${NC}"
mkdir -p ~/.local/share/fonts
cp -r ~/dev_env/fonts/* ~/.local/share/fonts/
printf "\n${COLOR}You cant set new font in terminal preferences${NC}"

printf "\n${COLOR}Remove original file init.vim, .tmux.conf and .bash_aliases ${NC}"
rm ~/.config/nvim/init.vim ~/.bash_aliases ~/.tmux.conf

printf "\n${COLOR}Create sybolic link for init.vim, .tmux.con and .bash_aliases ${NC}"
ln -s ~/dev_env/init.vim ~/.config/nvim/init.vim
ln -s ~/dev_env/.bash_aliases ~/.bash_aliases
ln -s ~/dev_env/.tmux.conf ~/.tmux.conf

printf "\n${COLOR}Install plugins for tmux and neovim ${NC} \n"
python3 -m pip install spotify-cli-linux
~/.tmux/plugins/tpm/bin/install_plugins
nvim +PlugInstall +qall

printf "\n${COLOR}Source .bashrc ${NC} \n"
source ~/.bashrc

printf "\n${COLOR}Done! Enjoy! ${NC} \n\n"
