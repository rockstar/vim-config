This is my vim configuration.

Plugins are managed with vim-plug. They are not kept in version control. To
install vim-plug...

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall


Dependencies
============

Syntastic has some requirements that are used regularly:

  - flake8
  - htmltidy

The `rust.vim` plugin is configured for using multirust. After multirust is set
up, do

    cargo install rustfmt
