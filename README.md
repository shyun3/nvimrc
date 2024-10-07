## Windows

1. Install Neovim and other dependencies using [Scoop](http://scoop.sh):
    ```
    scoop install git
    scoop bucket add extras
    scoop install neovim python ripgrep universal-ctags fzf llvm
    pip install --user pynvim
    ```

1. Extract this repo to the proper directory (using Powershell):
    ```
    git clone https://github.com/shyun3/nvimrc ~/AppData/Local/nvim
    ```

1. Install [vim-plug](https://github.com/junegunn/vim-plug)

1. Start Neovim. Ignore any errors and run `:PlugInstall`. Exit when finished.

1. Download [Powerline fonts](https://github.com/powerline/fonts). Install them
   by running `install.ps1`.

1. Happy Vimming!
    ```
    nvim-qt
    ```
