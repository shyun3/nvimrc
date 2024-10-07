## Windows

1. Install Neovim and other dependencies using [Scoop](http://scoop.sh):
    ```
    scoop install git
    scoop bucket add extras
    scoop install neovim python ripgrep universal-ctags nodejs yarn
    ```

1. Clone this repo to the proper directory (using Powershell):
    ```
    git clone --recursive https://github.com/shyun3/nvimrc ~/AppData/Local/nvim
    ```

1. Install [vim-plug](https://github.com/junegunn/vim-plug)

1. Build the [ccls](https://github.com/MaskRay/ccls) submodule
    - Remember to use the x86 Visual Studio command prompt, RTTI, and forward
    slashes in paths

1. Start Neovim. Ignore any errors and run `:PlugInstall`. Exit when finished.

1. Download [Powerline fonts](https://github.com/powerline/fonts). Install them
   by running `install.ps1`.

1. Happy Vimming!
    ```
    nvim-qt
    ```
