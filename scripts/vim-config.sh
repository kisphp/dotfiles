#!/usr/bin/env bash

VIMCFG="${HOME}/.vimrc"

echo "set enc=utf-8" >> $VIMCFG
echo "set fenc=utf-8" >> $VIMCFG
echo "set termencoding=utf-8" >> $VIMCFG
echo "set encoding=utf-8" >> $VIMCFG

echo "set nocompatible" >> $VIMCFG

echo "set autoindent" >> $VIMCFG
echo "set smartindent" >> $VIMCFG
echo "set tabstop=4" >> $VIMCFG
echo "set shiftwidth=4" >> $VIMCFG
echo "set expandtab" >> $VIMCFG

echo "set bs=2" >> $VIMCFG

echo "set clipboard=unnamed" >> $VIMCFG

echo "syntax on" >> $VIMCFG

echo "set number" >> $VIMCFG
echo "set showmatch" >> $VIMCFG
