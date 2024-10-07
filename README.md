## Windows

1. Install Neovim and other dependencies using [Scoop](http://scoop.sh):
    ```powershell
    scoop install git
    scoop bucket add extras
    scoop install neovim ripgrep universal-ctags nodejs yarn openssl miniconda3 llvm
    pip install pynvim python-language-server
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

1. Install [coc extensions](#coc-extensions)

1. Restart Neovim. Run `:checkhealth` and resolve any issues.

1. Done!

## Xubuntu

1. Install [Neovim][nvim-linux] and [neovim-qt][]
   
1. Install dependencies:
* [ripgrep][] and [Universal Ctags][]
* [Node.js](https://nodejs.org/en/), recent version
    * Make sure to set the [`PATH`][node-install] and handle any
      certificate issues
* [Yarn](https://yarnpkg.com/getting-started/install)
* openssl and LLVM (recent): Use package manager

1. Clone this repo to the proper directory:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```
    
1. Create undo directory:
    ```bash
    mkdir -p ~/.local/share/nvim/undo
    ```

1. Install [vim-plug][]:
    ```bash
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
    
1. Download [Powerline fonts][]. Install them by running `install.sh`.

1. Start Neovim: `nvim-qt`. Ignore any errors and run `:PlugInstall`.

1. Install [coc extensions](#coc-extensions)

1. Restart Neovim. Run `:checkhealth` and resolve any issues.

1. Done!

# CoC Extensions
```vim
:CocInstall coc-json coc-tag coc-ultisnips coc-syntax coc-pyls coc-omnisharp
```

[nvim-linux]: https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
[neovim-qt]: https://github.com/equalsraf/neovim-qt
[ripgrep]: https://github.com/BurntSushi/ripgrep#installation
[Universal Ctags]: https://github.com/universal-ctags/ctags#how-to-build-and-install
[node-install]: https://github.com/nodejs/help/wiki/Installation
[vim-plug]: https://github.com/junegunn/vim-plug
[Powerline fonts]: https://github.com/powerline/fonts
