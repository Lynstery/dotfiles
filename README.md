# Lynstery's Dotfiles

my personal dotfiles for (Linux/macOS)

some part of project stucture is inspired by [holman/dotfiles](https://github.com/holman/dotfiles)

## Dependencies

The Dotfiles is not responsible for install dependencies, but setup configure files. You should manually install your dependencies.

Current Dependencies:
- neovim
- tmux
- fzf
- zoxide
- eza

## topical

Everything's built around topic areas. You can add a new directory `<topic>` and put
files in there.

## components

There's a few special files in the hierarchy.
- **functions/**: load personal functions and their completion method.
- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.

## install

Run:

```sh
git clone https://github.com/lynstery/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/install
```
