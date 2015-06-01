## setup

    cd ~
    git clone https://github.com/fzort/dotvim .vim
    ln -s .vim/vimrc .vimrc
    cd .vim
    git submodule update --init --recursive

then, to generate documentation, run `:Helptags` from vim.

## tips

vim on debian isn't compiled with python support. you can check with:

    vim --version | grep +python

to build vim from source with python support:

    apt-get install mercurial libncurses-dev libpython2.7-dev
    hg clone https://code.google.com/p/vim/
    ./configure \
            --prefix=/usr \
            --enable-gui=no \
            --without-x \
            --enable-multibyte \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-cscope \
            --with-features=huge
    make
    make install

for clang complete:

    apt-get install libclang1
    cd /usr/lib/x86_64-linux-gnu
    ln -s libclang.so.1 libclang.so
