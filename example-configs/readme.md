# Example configuration files

This directory contains examples and templates for configuration files that are
often used in Neovim projects. The workflow is generally to copy needed files
to a project and customize as necessary.

## .clangd

Copy to C/C++ project root and customize:
```bash
cp /path/to/clangd-config /path/to/project/.clangd
```

For use with [clangd][] (v11 or later).

## compile\_flags.txt

Copy to C/C++ project root and customize. For use with [clangd][].

## .projections.json

Copy to project root and customize. For use with [vim-projectionist][]:
```bash
cp /path/to/projections.json /path/to/project/.projections.json
```

## projects.vim

Copy to Neovim config directory and customize:
```bash
cp /path/to/projects.vim ~/.config/nvim
```

## pyrightconfig.json

Copy to Python project root and customize.

[clangd]: https://clangd.llvm.org/
[vim-projectionist]: https://github.com/tpope/vim-projectionist
