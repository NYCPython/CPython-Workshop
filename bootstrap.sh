#!/usr/bin/env bash

# Make sure everything is up to date
apt-get update

# Install the basics
apt-get install -y build-essential python{2.7,3.3} python{2.7,3.3}-dev
apt-get build-dep python{2.7,3.3}

# Install some extras
apt-get install -y bpython{,3} cython{,3} emacs exuberant-ctags gdb git htop \
    ipython{,3} mercurial moreutils pypy python-virtualenv python{,3}-pip qalc \
    screen tmux tree vim zsh

# Build Python
mkdir built
pushd built

# 2.7.6 and 3.3.2 are in /vagrant, so those don't need to be downloaded
hg clone http://hg.python.org/cpython

if [[ ! -d Python-2.7.6 ]]; then
        tar xJvf /vagrant/Python-2.7.6.tar.xz

        pushd Python-2.7.6
        find \( -iname  '*.py' -or -iname '*.c' -or -iname '*.h' \) -print0 | xargs -0 ctags-exuberant
        CFLAGS="-g3 -ggdb -gdwarf-4" ./configure --with-pydebug --prefix=$PWD-build && make -j9 && make install
        popd
fi

if [[ ! -d Python-3.3.2 ]]; then
        tar xJvf /vagrant/Python-3.3.2.tar.xz

        pushd Python-3.3.2
        find \( -iname  '*.py' -or -iname '*.c' -or -iname '*.h' \) -print0 | xargs -0 ctags-exuberant
        CFLAGS="-g3 -ggdb -gdwarf-4" ./configure --with-pydebug --prefix=$PWD-build && make -j9 && make install
        popd
fi

if [[ -d cpython ]]; then
        pushd cpython
        find \( -iname  '*.py' -or -iname '*.c' -or -iname '*.h' \) -print0 | xargs -0 ctags-exuberant
        CFLAGS="-g3 -ggdb -gdwarf-4" ./configure --with-pydebug --prefix=$PWD-build && make -j9 && make install
        popd
fi

# Give the user control of the build
chown -R vagrant:vagrant ~vagrant
