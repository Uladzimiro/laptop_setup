# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# z-shell config
cp .zshrc ~/

# setup tmux
brew install tmux
cp .tmux.conf ~/

# setup vim
brew install vim
cp .vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir -p ~/.vim/colors/
cp .vim/colors/solarized.vim ~/.vim/colors/

# setup git
brew install git
git config --global user.name "xxx"
git config --global user.email "xxx@gmail.com"
git config --global color.ui true 
