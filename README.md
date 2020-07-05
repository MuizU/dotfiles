# SETUP

- git init --bare \$HOME/dotfiles.git
- echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"' >> \$HOME/.zshrc
- source ~/.zshrc
- dotfiles config --local status.showUntrackedFiles no

now dotfiles can be used instead of git since it's an alias when handling actions of the repository eg:- dotfiles add .vimrc

# Installing dotfiles into another system

- echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"' >> \$HOME/.zshrc'
- source ~/.zshrc
- echo "dotfiles.git" >> .gitignore
- git clone --bare git@github.com:MuizU/dotfiles.git
- dotfiles checkout
- dotfiles config --local status.showUntrackedFiles no

Source: https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html
