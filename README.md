## Windows

1. Install Neovim and other dependencies using [Scoop](http://scoop.sh):
    ```powershell
    scoop install git
    scoop bucket add extras
    scoop install neovim ripgrep universal-ctags nodejs yarn openssl miniconda3 llvm
    pip3 install neovim
    ```

1. Clone this repo to the proper directory (using Powershell):
    ```powershell
    git clone https://github.com/shyun3/nvimrc "$(Resolve-Path ~)/AppData/Local/nvim"
    ```

1. Create undo directory
    ```powershell
    mkdir ~/AppData/Local/nvim-data/undo
    ```

1. Install [vim-plug][]

1. Download [Powerline fonts][]. Install them by running `install.ps1`.

1. Start Neovim: `nvim-qt`. Ignore any errors and run `:PlugInstall`.

1. Restart Neovim. Run `:checkhealth` and resolve any issues.

1. Done!

## Linux

1. Clone this repo to the proper directory:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```

1. Install [Neovim][nvim-linux] and [neovim-qt][]

1. Prepare a Python virtual environment:
    ```bash
    cd ~/.config/nvim
    virtualenv -p python3.7 nvim-venv
    nvim-venv/bin/pip install pynvim vim-bridge
    ```
    * Note that Neovim may not work with Python newer than 3.7
    * Pip may need to be [configured][pip-conf]
   
1. Install dependencies:
    * [ripgrep][] and [Universal Ctags][]
    * [Node.js](https://nodejs.org/en/), recent version
        * Make sure to set the [`PATH`][node-install] and handle any
          certificate issues
    * [Yarn](https://yarnpkg.com/getting-started/install)
    * openssl and LLVM (recent): Use package manager
        * Make sure that `clangd` and `clang-format` are on the `PATH`
    
1. Create undo directory:
    ```bash
    mkdir -p ~/.local/share/nvim/undo
    ```

1. Install [vim-plug][] and [Powerline fonts][]

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Restart Neovim. Run `:checkhealth` and resolve any issues.

1. Done!

## macOS

1. Install [Homebrew](https://brew.sh)

1. Install Neovim and some dependencies:
    ```bash
    brew install neovim ripgrep node yarn
    ```

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```
    
1. Create [undo directory][nvim-undo-dir]:
    ```bash
    mkdir -p ~/.local/share/nvim/undo
    ```

1. Prepare a Python virtual environment:
    ```bash
    cd ~/.config/nvim
    virtualenv -p python3 nvim-venv
    nvim-venv/bin/pip install pynvim
    ```
    * Pip may need to be [configured][pip-conf]
    
1. Install [Universal Ctags][mac-univ-ctags]
    
1. Install LLVM: `brew install llvm`
    * Make sure that `clangd` and `clang-format` are on the `PATH`
    
1. Make sure to update any certificate settings for Node.js and Yarn

1. Install [vim-plug][] and [Powerline fonts][]

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Restart Neovim. Run `:checkhealth` and resolve any issues.

1. Done!

[nvim-linux]: https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
[neovim-qt]: https://github.com/equalsraf/neovim-qt
[ripgrep]: https://github.com/BurntSushi/ripgrep#installation
[Universal Ctags]: https://github.com/universal-ctags/ctags#how-to-build-and-install
[node-install]: https://github.com/nodejs/help/wiki/Installation
[vim-plug]: https://github.com/junegunn/vim-plug
[Powerline fonts]: https://github.com/powerline/fonts
[nvim-config-dir]: https://neovim.io/doc/user/starting.html#config
[pip-conf]: https://pip.pypa.io/en/stable/user_guide/#config-file
[mac-univ-ctags]: https://github.com/universal-ctags/homebrew-universal-ctags
[nvim-undo-dir]: https://neovim.io/doc/user/options.html#'undodir'
