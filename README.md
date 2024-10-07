# Installation

## Ubuntu Linux

1. Clone this repo to the [proper directory][nvim-config-dir]:
    ```bash
    git clone https://github.com/shyun3/nvimrc ~/.config/nvim
    ```

1. Install [Neovim][nvim-linux]

1. Install dependencies and include them in the `PATH`:
    * `sudo apt install ripgrep bat universal-ctags wl-clipboard`
        * Make sure to create a symlink for `bat` (see [link][bat-install])
    * [fd][], `fzf`, `lazygit`
        * `fd` >= 9.0.0 is recommended for improved performance
    * `node`
        * Latest version (with `npm`) can be installed through `nvm`:
            `nvm install node`
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

1. Install [Nerd Fonts][]
    * Currently, JetBrains Mono v2.304 with no ligatures and bigger icons is
      preferred
    * Remember to update the terminal font

1. Start Neovim. Plugins should be automatically installed.

1. Run `:checkhealth` and resolve any issues.

1. Restart Neovim. Installation should now be complete.

# Example configuration files

See the corresponding [README](example-configs/readme.md).

# Tips

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

## Python

* Formatter options may be specified through a project top-level
  `pyproject.toml`, for example:
    ```
    [tool.black]
    unstable = true

    [tool.isort]
    profile = "black"
    ```
  Using the unstable option for black may be useful to have it break long
  strings, see the [future style docs][black-future]. `isort` can also be
  configured for `black` compatibility by specifying the profile (see
  [docs][isort-black]).
* [Pyright](https://github.com/microsoft/pyright) can read type stubs placed in
  the `typings` directory. This can be customized using the `stubPath` option
  in the `pyrightconfig.json`. See also [Generating Type Stubs][type-stubs].

## UltiSnips

* Add snippets under the `UltiSnips/specific` directory for snippets that are
  meant to be machine-specific and not saved in the repo.

[nvim-linux]: https://github.com/neovim/neovim/blob/master/INSTALL.md
[node-install]: https://github.com/nodejs/help/wiki/Installation
[Nerd Fonts]: https://www.nerdfonts.com/font-downloads
[nvim-config-dir]: https://neovim.io/doc/user/starting.html#config
[nvim-undo-dir]: https://neovim.io/doc/user/options.html#'undodir'
[fd]: https://github.com/sharkdp/fd#on-ubuntu
[bat-install]: https://github.com/sharkdp/bat#on-ubuntu-using-apt
[type-stubs]: https://github.com/microsoft/pyright/blob/main/docs/type-stubs.md#generating-type-stubs
[black-future]: https://black.readthedocs.io/en/stable/the_black_code_style/future_style.html
[isort-black]: https://pycqa.github.io/isort/docs/configuration/black_compatibility.html
