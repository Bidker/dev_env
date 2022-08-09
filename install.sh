#!bin/bash

COLOR='\033[1;36m'
NC='\033[0m'

printf "${COLOR}Install tmux and neovim\n ${NC}"
sudo apt-get install -y tmux neovim python3-pip curl fd-find
sudo apt-get install -y ipython

printf "\n${COLOR}Create folders for fonts and i copy font from repository to new folder${NC}"
mkdir -p ~/.local/share/fonts
cp -r ~/dev_env/fonts/* ~/.local/share/fonts/
printf "\n${COLOR}You can set new font in terminal preferences${NC}"

printf "\n${COLOR}Install pythons dependences${NC}\n"
python -m pip install jedi
python -m pip install  --user pynvim
python -m pip install flake8
python -m pip install spotify-cli-linux
python -m pip install pynvim
python -m pip install --user smdv

printf "\n${COLOR}Remove original file flake8, init.vim, .tmux.conf and .bash_aliases ${NC}"
mkdir ~/.config/nvim/
rm ~/.config/nvim/init.vim ~/.bash_aliases ~/.tmux.conf ~/.config/flake8

printf "\n${COLOR}Create sybolic link for flake8, init.vim, .tmux.con and .bash_aliases ${NC}"
ln -s ~/dev_env/init.vim ~/.config/nvim/init.vim
ln -s ~/dev_env/.bash_aliases ~/.bash_aliases
ln -s ~/dev_env/tmux.conf ~/.tmux.conf
ln -s ~/dev_env/flake8 ~/.config/flake8

printf "\n${COLOR}Install plugins for tmux and neovim ${NC} \n"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

export FZF_DEFAULT_COMMAND='fd --type f'

printf "\n${COLOR}Source .bashrc ${NC} \n"
source ~/.bashrc

printf "\n${COLOR}Now you can install:
    DBeaver: https://dbeaver.io/download/
    and vim plugin for him: https://github.com/dbeaver/dbeaver/issues/3448
    Docker: https://docs.docker.com/engine/install/ubuntu/
    Docker-compose: https://docs.docker.com/compose/install/
    Spotify: https://www.spotify.com/pl/download/linux/
    Nerd-fonts: https://github.com/ryanoasis/nerd-fonts#single-font
    For fix dash to dock run: gnome-extensions disable ubuntu-dock@ubuntu.com
${NC} \n"
printf "${COLOR}Done! Enjoy! ${NC} \n\n"
