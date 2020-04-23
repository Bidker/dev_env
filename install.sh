#!bin/bash

COLOR='\033[1;36m'
NC='\033[0m'

install_dbeaver='y'
install_spotify='y'
install_docker='y'
install_docker_compose='y'

printf "${COLOR}Install tmux and neovim\n ${NC}"
sudo apt-get install -y tmux neovim ipython

printf "\n${COLOR}Do you want install full dev enviroment (include DBeaver, Docker, Docker-compose and Spotify)? ${NC}\n"
read -r -p "possible answer: y- [Y]es, n- [N]o, s- i want [S]elect " response
if [[ "$response" =~ ^([nN])$ ]]
then
    install_dbeaver='n'
    install_spotify='n'
    install_docker='n'
    install_docker_compose='n'
elif [[ "$response" =~ ^([sS]) ]]
then
    printf "\n${COLOR}Do you want install DBeaver? (project site: https://dbeaver.io/) [Y/n] ${NC}"
    read -r -p "" install_dbeaver
    printf "\n${COLOR}Do you want install Docker? (project site: https://www.docker.com/) [Y/n] ${NC}"
    read -r -p "" install_docker
    printf "\n${COLOR}Do you want install Docker-compose? (project site: https://docs.docker.com/compose/) [Y/n] ${NC}"
    read -r -p "" install_docker_compose
    printf "\n${COLOR}Do you want install Spotify? (project site: https://www.spotify.com/) [Y/n] ${NC}"
    read -r -p "" install_spotify
fi

if [[ "$install_dbeaver" =~ ^([yY])$ ]]
then
    printf "\n${COLOR}Install DBeaver${NC}\n"
    sudo add-apt-repository ppa:serge-rider/dbeaver-ce
    sudo apt-get update
    sudo apt-get install -y dbeaver-ce
fi

if [[ "$install_docker" =~ ^([yY])$ ]]
then
    sudo apt-get remove -y docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-comm
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    printf "\n"
    docker -v
fi

if [[ "$install_docker_compose" =~ ^([yY])$ ]]
then
    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    printf "\n"
    docker-compose --version
fi

if [[ "$install_spotify" =~ ^([yY])$ ]]
then
    printf "\n${COLOR}Install spotify and spotify client for linux ${NC}\n"
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
fi

printf "\n${COLOR}Create folders for fonts and i copy font from repository to new folder${NC}"
mkdir -p ~/.local/share/fonts
cp -r ~/dev_env/fonts/* ~/.local/share/fonts/
printf "\n${COLOR}You can set new font in terminal preferences${NC}"

printf "\n${COLOR}Install pythons dependences${NC}"
python3 -m pip install jedi
python3 -m pip install  --user pynvim
python3 -m pip install flake8
python3 -m pip install spotify-cli-linux
python3 -m pip install pynvim

printf "\n${COLOR}Remove original file flake8, init.vim, .tmux.conf and .bash_aliases ${NC}"
rm ~/.config/nvim/init.vim ~/.bash_aliases ~/.tmux.conf ~/.config/flake8

printf "\n${COLOR}Create sybolic link for flake8, init.vim, .tmux.con and .bash_aliases ${NC}"
ln -s ~/dev_env/init.vim ~/.config/nvim/init.vim
ln -s ~/dev_env/.bash_aliases ~/.bash_aliases
ln -s ~/dev_env/tmux.conf ~/.tmux.conf
ln -s ~/dev_env/flake8 ~/.config/flake8

printf "\n${COLOR}Install plugins for tmux and neovim ${NC} \n"

~/.tmux/plugins/tpm/bin/install_plugins
nvim +PlugInstall +qall

printf "\n${COLOR}Source .bashrc ${NC} \n"
source ~/.bashrc

printf "\n${COLOR}Now you can install vim plugin in DBeaver: https://github.com/dbeaver/dbeaver/issues/3448 ${NC} \n"
printf "${COLOR}Done! Enjoy! ${NC} \n\n"
