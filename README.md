# Installation

## Linux

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```

1. Install [Neovim][nvim-linux]
   
1. Install dependencies:
    * [ripgrep][], [Universal Ctags][], [fd][]
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

1. Install [vim-plug][] and [Powerline fonts][]

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Run `:checkhealth` and resolve any issues.

1. Install [cpsm][]

1. Done!

## macOS

1. Install [Homebrew](https://brew.sh)

1. Install Neovim and some dependencies:
    ```bash
    brew install neovim ripgrep node yarn fd
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

1. Install [vim-plug][] and [Powerline fonts][]

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Run `:checkhealth` and resolve any issues.

1. Install [cpsm][]

1. Done!

# Troubleshooting

* If running Neovim from the terminal and some symbols don't display
  properly, make sure to update the terminal font accordingly.

[nvim-linux]: https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
[ripgrep]: https://github.com/BurntSushi/ripgrep#installation
[Universal Ctags]: https://github.com/universal-ctags/ctags
[node-install]: https://github.com/nodejs/help/wiki/Installation
[vim-plug]: https://github.com/junegunn/vim-plug#neovim
[Powerline fonts]: https://github.com/powerline/fonts#installation
[nvim-config-dir]: https://neovim.io/doc/user/starting.html#config
[mac-univ-ctags]: https://github.com/universal-ctags/homebrew-universal-ctags
[nvim-undo-dir]: https://neovim.io/doc/user/options.html#'undodir'
[cpsm]: https://github.com/nixprime/cpsm
[fd]: https://github.com/sharkdp/fd#installation
