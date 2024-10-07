# Installation

## Ubuntu Linux

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```

1. Install [Neovim][nvim-linux]

1. Install dependencies and include them in the `PATH`:
    * `sudo apt install ripgrep bat universal-ctags pandoc`
        * Make sure to create a symlink for `bat` (see [link][bat-install])
    * [fd][], `fzf`
        * `fd` >= 9.0.0 is recommended for improved performance
    * [LLVM][]
        * Latest version is preferred. Prefer the automatic install script.
        * Remember to create symlink for `clangd`
        * The install script does not include `clang-format` so make sure to
          install that through `apt` afterwards. Make sure to also create a
          symlink.
    * `node`
        * Latest version (with `npm`) can be installed through `nvm`:
            `nvm install node`
        * Dependencies:
            `npm install -g yarn @compodoc/live-server prettier prettier-plugin-sh`
    * `pyenv`
        * Prepare virtual environment:
            ```zsh
            pyenv virtualenv 3 neovim
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
    * For `clipboard` on WSL, see `:h clipboard`. Consider using
      [win32yank.exe][].

1. Restart Neovim. Installation should now be complete.

# Example configuration files

See the corresponding [README](example-configs/readme.md).

# Tips

## Plugins

[coc extensions][coc-extensions] can also provide functionality akin to
plugins.

## clangd

* The [example clangd config](example-configs/clangd-config) contains hints for
  cross-compiling and resolving system header issues. The `clangd` [system
  headers](https://clangd.llvm.org/guides/system-headers) documentation is also
  helpful.
* When specifying paths with embedded spaces in `compile_flags.txt`, do not
  introduce quotes or backslashes to escape as this will be handled by
  `clangd`. For example:
  ```
  -Ipath with spaces
  ```
* To see the compile options used by `coc-clangd`, enter [`:CocCommand
  workspace.showOutput clangd`][coc-output-channel]
* Running `:CocRestart` may not cause `clangd` to re-parse source files, due to
  caching. One way to force this is by deleting buffers using `:bd`.

## Python

* Install formatters through the Neovim `virtualenv`, then symlink them to a
  user `bin` folder available in the `PATH`. Example:
    ```bash
    pyenv activate neovim
    pip install isort black

    ln -s $(pyenv which isort) ~/bin/isort
    # ...
    ```
* [Pyright](https://github.com/microsoft/pyright) can read type stubs placed in
  the `typings` directory. This can be customized using the `stubPath` option
  in the `pyrightconfig.json`. See also [Generating Type Stubs][type-stubs].

## UltiSnips

* Add snippets under the `UltiSnips/specific` directory for snippets that are
  meant to be machine-specific and not saved in the repo.

[nvim-linux]: https://github.com/neovim/neovim/blob/master/INSTALL.md
[node-install]: https://github.com/nodejs/help/wiki/Installation
[vim-plug]: https://github.com/junegunn/vim-plug#neovim
[Nerd Fonts]: https://www.nerdfonts.com/font-downloads
[nvim-config-dir]: https://neovim.io/doc/user/starting.html#config
[nvim-undo-dir]: https://neovim.io/doc/user/options.html#'undodir'
[fd]: https://github.com/sharkdp/fd#on-ubuntu
[bat-install]: https://github.com/sharkdp/bat#on-ubuntu-using-apt
[LLVM]: https://apt.llvm.org/
[jetbrains-mono]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures
[type-stubs]: https://github.com/microsoft/pyright/blob/main/docs/type-stubs.md#generating-type-stubs
[coc-extensions]: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
[coc-output-channel]: https://github.com/neoclide/coc.nvim/wiki/Debug-language-server#using-output-channel
[win32yank.exe]: https://github.com/equalsraf/win32yank
