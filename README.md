UltiTabs
================

## Contents

-   [Introduction](#introduction)
-   [Changes](#changes)
    -   [Tabclose](#tabclose)
    -   [Keybindings](#keybindings)
    -   [Tab numbers](#tab-numbers)
-   [Installation](#installation)
    -   [Vim](#vim)
    -   [Neovim](#neovim)

## Introduction

This plugins relates to all three definitions of tabs, including the
character and the key. It improves a lot of things relating to tabs.
First, it changes how `:tabclose` works. Then, it adds a couple of
keybindings relating to tabs. Additionally, it automatically numbers
tabs if you use vim-airline.

## Changes

### Tabclose

The `Tabclose` command is added which is a better version of Vim’s
original `tabclose`. `tabclose` is abbreviated to `Tabclose`, so you do
not have to worry about your muscle memory. Anyways, it adds plenty of
options that I believe should be included by default in Vim.

You can use `<`, `l`, or `left` as an argument to close all the tabs to
the left. The same is true for the right. You can close multiple tabs by
separating them by commas or spaces (e.g. `2,4` or `2 4`). Similarly,
you can specify a range of tabs by using a hyphen (e.g. `2-4`).

### Keybindings

You can go to any tab by its number by using `<Leader>N`, where `N` is
the number you wish to go to. You can use `<Leader>0` to return to the
last tab. The default `Leader` key is `\`, but you can change it using
`map mapleader = ','` as an example. If you use the
[Tabular](https://github.com/godlygeek/tabular) plugin, `<Leader><Tab>`
is mapped to `Tabularize`.

### Tab numbers

If you use the [vim-airline](https://github.com/vim-airline/vim-airline)
plugin, the airline tab extension will automatically be enabled.
Additionally, it will show the tab number on each tab. This can help you
with the keybindings mentioned before. I strongly recommend installing
the airline plugin. Support for numbering tabs without airline will
hopefully come in the future.

## Installation

### Vim

``` sh
`# user` git clone https://github.com/amarakon/nvim-sensible ~/.vim/pack/vendor/start/nvim-sensible
```

### Neovim

``` sh
`# user` git clone https://github.com/amarakon/nvim-sensible ~/.local/share/nvim/site/pack/default/start/nvim-sensible
```
