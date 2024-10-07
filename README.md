# Installation

## Linux

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```

1. Install [Neovim][nvim-linux]
   
1. Install dependencies:
    * [ripgrep][], [Universal Ctags][], [fzf][], [fd][], [bat][]
    * [Node.js](https://nodejs.org/en/), recent version
        * Make sure to set the [`PATH`][node-install] and handle any
          certificate issues
    * [Yarn](https://yarnpkg.com/getting-started/install)
    * LLVM (recent): Use package manager
        * Make sure that `clangd` and `clang-format` are on the `PATH`
    
1. Create [undo directory][nvim-undo-dir]:
    ```bash
    mkdir -p ~/.local/share/nvim/undo
    ```

1. Install [vim-plug][] and [Nerd Fonts][]

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Install Coc plugins:
    ```
    CocInstall coc-clangd coc-json coc-pyright coc-syntax coc-tag coc-ultisnips
    coc-vimlsp
    ```

1. Run `:checkhealth` and resolve any issues.

1. Done!

## macOS

1. Install [Homebrew](https://brew.sh)

1. Install Neovim and some dependencies:
    ```bash
    brew install neovim ripgrep node yarn fzf fd bat
    $(brew --prefix)/opt/fzf/install
    ```

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```
    
1. Create [undo directory][nvim-undo-dir]:
    ```bash
    mkdir -p ~/.local/share/nvim/undo
    ```
    
1. Install [Universal Ctags][mac-univ-ctags]
    
1. Install LLVM: `brew install llvm`
    * Make sure that `clangd` and `clang-format` are on the `PATH`
    
1. Make sure to update any certificate settings for Node.js and Yarn

1. Install [vim-plug][] and [Nerd Fonts][]

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Install Coc plugins:
    ```
    CocInstall coc-clangd coc-json coc-pyright coc-syntax coc-tag coc-ultisnips
    coc-vimlsp
    ```

1. Run `:checkhealth` and resolve any issues.

1. Done!

# Troubleshooting

* If running Neovim from the terminal and some symbols don't display
  properly, make sure to update the terminal font accordingly.

[nvim-linux]: https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
[ripgrep]: https://github.com/BurntSushi/ripgrep#installation
[Universal Ctags]: https://github.com/universal-ctags/ctags
[node-install]: https://github.com/nodejs/help/wiki/Installation
[vim-plug]: https://github.com/junegunn/vim-plug#neovim
[Nerd Fonts]: https://github.com/ryanoasis/nerd-fonts#tldr
[nvim-config-dir]: https://neovim.io/doc/user/starting.html#config
[mac-univ-ctags]: https://github.com/universal-ctags/homebrew-universal-ctags
[nvim-undo-dir]: https://neovim.io/doc/user/options.html#'undodir'
[fzf]: https://github.com/junegunn/fzf#installation
[fd]: https://github.com/sharkdp/fd#installation
[bat]: https://github.com/sharkdp/bat#installation
