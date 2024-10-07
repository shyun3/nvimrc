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

1. Install [vim-plug](https://github.com/junegunn/vim-plug)

1. Download [Powerline fonts](https://github.com/powerline/fonts). Install them
   by running `install.ps1`.

1. Start Neovim: `nvim-qt`. Ignore any errors and run `:PlugInstall`.

1. Install coc extensions:
    ```vim
    :CocInstall coc-json coc-tag coc-ultisnips coc-syntax coc-pyls coc-omnisharp
    ```

1. Restart Neovim and begin using
