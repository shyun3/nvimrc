## Windows

1. Install Neovim and other dependencies using [Scoop](http://scoop.sh):
    ```
    scoop install git
    scoop bucket add extras
    scoop install neovim anaconda3 ripgrep universal-ctags nodejs yarn openssl
    pip install pynvim python-language-server
    ```

1. Clone this repo to the proper directory (using Powershell):
    ```
    git clone --recursive https://github.com/shyun3/nvimrc ~/AppData/Local/nvim
    ```

1. Install [vim-plug](https://github.com/junegunn/vim-plug)

1. Build the [ccls](https://github.com/MaskRay/ccls) submodule
    - Remember to use the x86 Visual Studio command prompt, RTTI, and forward
    slashes in paths

1. Download [Powerline fonts](https://github.com/powerline/fonts). Install them
   by running `install.ps1`.

1. Start Neovim: `nvim-qt`. Ignore any errors and run `:PlugInstall`.

1. Install coc extensions:
    ```
    :CocInstall coc-json coc-tag coc-ultisnips coc-source-neco
    coc-source-neoinclude coc-syntax coc-pyls
    ```

1. Restart Neovim and begin using
