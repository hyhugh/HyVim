#!/bin/bash

# refer  spf13-vim bootstrap.sh`
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

# parse arguments
function show_help
{
    echo "install.sh [option]
    --for-vim       Install configuration files for vim, default option
    --for-neovim    Install configuration files for neovim
    --for-all       Install configuration files for vim & neovim
    --help          Show help messages
    For example:
        install.sh --for-vim
        install.sh --help"
    }
    FOR_VIM=true
    FOR_NEOVIM=false
    if [ "$1" != "" ]; then
        case $1 in
            --for-vim)
                FOR_VIM=true
                FOR_NEOVIM=false
                shift
                ;;
            --for-neovim)
                FOR_NEOVIM=true
                FOR_VIM=false
                shift
                ;;
            --for-all)
                FOR_VIM=true
                FOR_NEOVIM=true
                shift
                ;;
            *)
                show_help
                exit
                ;;
        esac
    fi

    lnif() {
        if [ -e "$1" ]; then
            ln -sf "$1" "$2"
        fi
    }


    echo "Step1: backing up current vim config"
    today=`date +%Y%m%d`
    if $FOR_VIM; then
        for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.plugins.vim; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
        for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.plugins.vim; do [ -L $i ] && unlink $i ; done
    fi
    if $FOR_NEOVIM; then
        for i in $HOME/.config/nvim $HOME/.config/nvim/init.vim; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
        for i in $HOME/.config/nvim/init.vim $HOME/.config/nvim; do [ -L $i ] && unlink $i ; done
    fi

    echo "Step2: setting up symlinks"
    if $FOR_VIM; then
        lnif $CURRENT_DIR/vimrc $HOME/.vimrc
        lnif $CURRENT_DIR/plugins.vim $HOME/.plugins.vim
        lnif "$CURRENT_DIR/" "$HOME/.vim"
    fi
    if $FOR_NEOVIM; then
        lnif "$CURRENT_DIR/" "$HOME/.config/nvim"
        lnif $CURRENT_DIR/vimrc $CURRENT_DIR/init.vim
    fi

    echo "Step3: update/install plugins using Vim-plug"
    system_shell=$SHELL
    export SHELL="/bin/sh"
    if $FOR_VIM; then
        vim -u $HOME/.plugins.vim +PlugInstall! +PlugClean! +qall
    else
        nvim -u $HOME/.plugins.vim +PlugInstall! +PlugClean! +qall
    fi
    export SHELL=$system_shell

    echo "Install Done!"
