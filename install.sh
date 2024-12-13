#!/bin/bash
set -e

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Installing software\033[0m"
echo -e "\033[32m ----------------------------------------\033[0m"
apt install -y git && \
apt install -y curl && \
apt install -y fzf && \
apt install -y xclip && \
apt install -y ripgrep && \
apt install -y fd-find && \
apt install -y build-essential && \
apt install -y tmux && \
apt install -y btop && \
apt install -y stow && \
apt install -y jq && \
apt install -y zsh 

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Configure Git\033[0m"
echo -e "\033[32m ----------------------------------------\033[0m"
git config --global user.email "8884041+Abazzi@users.noreply.github.com"
git config --global user.name "Adam Bazzi"


echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install Rust"
echo -e "\033[32m ----------------------------------------\033[0m"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install packages via cargo"
echo -e "\033[32m ----------------------------------------\033[0m"
cargo install \
  bat\
  bob\
  silicon\

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Setup bob (Neovim Version Manager)"
echo -e "\033[32m ----------------------------------------\033[0m"
bob use stable

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Sym link neovim config\033[0m"
echo -e "\033[32m ----------------------------------------\033[0m"
git submodule init

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Build fzf for use in Telescope\033[0m"
echo -e "\033[32m ----------------------------------------\033[0m"
pushd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
make
popd

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install tpm (Tmux Package Manager)"
echo -e "\033[32m ----------------------------------------\033[0m"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install nvm to manage NodeJS\033[0m"
echo -e "\033[32m ----------------------------------------\033[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# exec bash
nvm install --lts
nvm use --lts

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Copy Tmux Config and tmux-sessionizer"
echo -e "\033[32m ----------------------------------------\033[0m"
cp ~/.dotfiles/tmux/tmux-sessionizer ~/.local/bin/

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install go (and remove old go installation if it exists)"
echo -e "\033[32m ----------------------------------------\033[0m"
wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install golang based packages"
echo -e "\033[32m ----------------------------------------\033[0m"
go install github.com/jesseduffield/lazygit@latest
go install github.com/antonmedv/walk@latest
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
sudo apt update
sudo apt install timer

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install lolcat (C based version)"
echo -e "\033[32m ----------------------------------------\033[0m"
git clone https://github.com/jaseg/lolcat.git 
cd lolcat/
make && sudo make install
cd ..

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Install pip"
echo -e "\033[32m ----------------------------------------\033[0m"
apt-get install pip

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Run GNU Stow\033[0m"
echo -e "\033[32m ----------------------------------------\033[0m"
stow .

echo -e "\033[32m ----------------------------------------\033[0m"
echo -e "\033[32m Change Shell to Zsh\033[0m"
echo -e "\033[32m ----------------------------------------\033[0m"
chsh -s $(which zsh)

echo                                                                                                                                       
" @@@@@@   @@@@@@@@  @@@@@@@  @@@  @@@  @@@@@@@       @@@@@@@   @@@@@@   @@@@@@@@@@   @@@@@@@   @@@       @@@@@@@@  @@@@@@@  @@@@@@@@  
@@@@@@@   @@@@@@@@  @@@@@@@  @@@  @@@  @@@@@@@@     @@@@@@@@  @@@@@@@@  @@@@@@@@@@@  @@@@@@@@  @@@       @@@@@@@@  @@@@@@@  @@@@@@@@  
!@@       @@!         @@!    @@!  @@@  @@!  @@@     !@@       @@!  @@@  @@! @@! @@!  @@!  @@@  @@!       @@!         @@!    @@!       
!@!       !@!         !@!    !@!  @!@  !@!  @!@     !@!       !@!  @!@  !@! !@! !@!  !@!  @!@  !@!       !@!         !@!    !@!       
!!@@!!    @!!!:!      @!!    @!@  !@!  @!@@!@!      !@!       @!@  !@!  @!! !!@ @!@  @!@@!@!   @!!       @!!!:!      @!!    @!!!:!    
 !!@!!!   !!!!!:      !!!    !@!  !!!  !!@!!!       !!!       !@!  !!!  !@!   ! !@!  !!@!!!    !!!       !!!!!:      !!!    !!!!!:    
     !:!  !!:         !!:    !!:  !!!  !!:          :!!       !!:  !!!  !!:     !!:  !!:       !!:       !!:         !!:    !!:       
    !:!   :!:         :!:    :!:  !:!  :!:          :!:       :!:  !:!  :!:     :!:  :!:        :!:      :!:         :!:    :!:       
:::: ::    :: ::::     ::    ::::: ::   ::           ::: :::  ::::: ::  :::     ::    ::        :: ::::   :: ::::     ::     :: ::::  
:: : :    : :: ::      :      : :  :    :            :: :: :   : :  :    :      :     :        : :: : :  : :: ::      :     : :: ::  
" | lolcat 
