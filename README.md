# Installation

## Ubuntu Linux

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```

1. Install [Neovim][nvim-linux] (must be at least v0.5.0)
   
1. Install dependencies:
    * `sudo apt install ripgrep universal-ctags fd-find clangd clang-format
      pandoc`
        * Make sure to create a symlink for `fd`, see [note][fd-install]
    * [fzf][], [bat][]
        * `fzf` must be > v0.23.1, see [issue #63][fzf-issue-63]
        * `bat` should be installed through a `.deb` package,
          see [issue #938][bat-issue-938]
    * [Node.js](https://nodejs.org/en/) (must be at least v12)
        * Make sure to set the [`PATH`][node-install]
        * Dependencies: `npm install -g yarn live-server`
    
1. Create [undo directory][nvim-undo-dir]:
    ```bash
    mkdir -p ~/.local/share/nvim/undo
    ```

1. Install [vim-plug][] and [Nerd Fonts][]

1. Start Neovim. Ignore any errors and run `:PlugInstall`.

1. Run `:checkhealth` and resolve any issues.

1. Restart Neovim. Installation should now be complete.

# Troubleshooting

* If running Neovim from the terminal and some symbols don't display
  properly, make sure to update the terminal font accordingly.

[nvim-linux]: https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
[node-install]: https://github.com/nodejs/help/wiki/Installation
[vim-plug]: https://github.com/junegunn/vim-plug#neovim
[Nerd Fonts]: https://www.nerdfonts.com/font-downloads
[nvim-config-dir]: https://neovim.io/doc/user/starting.html#config
[nvim-undo-dir]: https://neovim.io/doc/user/options.html#'undodir'
[fd-install]: https://github.com/sharkdp/fd#on-ubuntu
[fzf]: https://github.com/junegunn/fzf#using-git
[fzf-issue-63]: https://github.com/ibhagwan/fzf-lua/issues/63
[bat]: https://github.com/sharkdp/bat#on-ubuntu-using-most-recent-deb-packages
[bat-issue-938]: https://github.com/sharkdp/bat/issues/938
