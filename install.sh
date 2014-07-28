##### Vim ####

# Make symlink
ln -s $(pwd)/vim ~/.vim

# Make swap and backup directories for vim
mkdir vim/.swap
mkdir vim/.backup

# Install vundle
git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim

# Install vim plugins
vim +PluginInstall +qall

# Build vimproc
cd vim/bundle/vimproc.vim
make

# Build YouCompleteMe
cd -
cd vim/bundle/YouCompleteMe
./install.sh

# Install tern's dependencies
cd -
cd vim/bundle/tern_for_vim
npm install


