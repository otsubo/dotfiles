mkdir -p $HOME/.local/bin

# install hub
if ! which hub &>/dev/null; then
    wget https://github.com/github/hub/releases/download/v2.2.1/hub-linux-amd64-2.2.1.tar.gz
    tar zxvf hub-linux-amd64-2.2.1.tar.gz
    cp hub-linux-amd64-2.2.1/hub $HOME/.local/bin/hub
    rm -rf hub-linux-amd64-2.2.1
    rm hub-linux-amd64-2.2.1.tar.gz
fi

ln -s $HOME/.dotfiles/bashrc $HOME/.bashrc.otsubo
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/Xmodmap $HOME/.Xmodmap
ln -s $HOME/.dotfiles/percol.d $HOME/.percol.d
ln -s $HOME/.dotfiles/lessfilter $HOME/.lessfilter
