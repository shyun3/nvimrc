# Installation

## Ubuntu Linux

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```

1. Install [Neovim][nvim-linux] (must be at least v0.5.0)

1. Install dependencies and include them in the `PATH`:
    * `sudo apt install ripgrep universal-ctags clang-format pandoc`
    * [fd][], [fzf][], [bat][], [clangd][]
        * `fd` should be >= v8.1.0 to support global ignore files
        * `fzf` must be >= v0.23.1, see [issue #63][fzf-issue-63]
        * `bat` should be installed through a `.deb` package,
          see [issue #938][bat-issue-938]
        * Latest version of `clangd` is preferred
    * [Node.js](https://nodejs.org/en/download) (must be at least v12)
        * See [`PATH`][node-install] instructions
        * Dependencies: `npm install -g yarn live-server fixjson`
    * [pyenv][]
        * Prepare `virtualenv`:
            ```bash
            pyenv virtualenv <PYTHON3_VERSION> neovim
            pyenv activate neovim
            pip install pynvim
            ```

1. Create [undo directory][nvim-undo-dir]:
    ```bash
    mkdir -p ~/.local/share/nvim/undo
    ```

1. Install [vim-plug][] and [Nerd Fonts][]
    * Currently, [JetBrains Mono, No Ligatures][jetbrains-mono] is preferred
    * Remember to update the terminal font

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Run `:checkhealth` and resolve any issues.
    * For `clipboard` on WSL, see [Neovim FAQ][nvim-clipboard-wsl]

1. Restart Neovim. Installation should now be complete.

# Tips

## Python

* Install formatters through the Neovim `virtualenv`, then symlink them to a
  user `bin` folder available in the `PATH`. Example:
    ```bash
    pyenv activate neovim
    pip install isort black

    ln -s $(pyenv which isort) ~/bin/isort
    # ...
    ```

[nvim-linux]: https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
[node-install]: https://github.com/nodejs/help/wiki/Installation
[vim-plug]: https://github.com/junegunn/vim-plug#neovim
[Nerd Fonts]: https://www.nerdfonts.com/font-downloads
[nvim-config-dir]: https://neovim.io/doc/user/starting.html#config
[nvim-undo-dir]: https://neovim.io/doc/user/options.html#'undodir'
[fd]: https://github.com/sharkdp/fd#on-ubuntu
[fzf]: https://github.com/junegunn/fzf#using-git
[fzf-issue-63]: https://github.com/ibhagwan/fzf-lua/issues/63
[bat]: https://github.com/sharkdp/bat#on-ubuntu-using-most-recent-deb-packages
[bat-issue-938]: https://github.com/sharkdp/bat/issues/938
[nvim-clipboard-wsl]: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
[clangd]: https://github.com/clangd/clangd/releases
[jetbrains-mono]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures
[pyenv]: https://github.com/pyenv/pyenv#installation
