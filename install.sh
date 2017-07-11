#!/bin/sh

# this script should just work on RHEL-like systems (Fedora, CentOS).
# curl -s https://raw.githubusercontent.com/nathanjackson/dotfiles/altamira/install.sh | sh

uid=`id -u`
SUDO=""
if [ $uid != 0 ];
then
    echo you are not root, don\'t be suprised if i ask for your sudo password
    SUDO="sudo"
fi

eval "$SUDO yum groupinstall -y \"Development Tools\""
eval "$SUDO yum install -y vim epel-release"

# Install vundle.
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# Install vimrc
curl -s -o $HOME/.vimrc https://raw.githubusercontent.com/nathanjackson/dotfiles/altamira/.vimrc
# we have to fork off a process to install plugins because i think vim takes
# over the pid of the shell
vim -c 'PluginInstall' -c 'qall' &
wait $!
# vim blows up the terminal, so fix it
reset

# Setup GOPATH
eval "$SUDO yum install -y golang"
mkdir -p $HOME/GoPath
echo "export GOPATH=$HOME/GoPath" >> $HOME/.bashrc
echo "export PATH=$GOPATH/bin" >> $HOME/.bashrc
echo "go get -u github.com/nsf/gocode"

# setup command-t
eval "$SUDO yum install -y ruby-devel redhat-rpm-config"
pushd $HOME/.vim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
popd
