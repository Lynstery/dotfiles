# Lynstery's Dotfiles

my personal dotfiles for (Linux/macOS)

some part of project structure is inspired by [holman/dotfiles](https://github.com/holman/dotfiles)

## Dependencies

The Dotfiles is not responsible for install dependencies, but install configure files. You should manually install your dependencies.

Dependencies:
- neovim
- tmux
- fzf
- zoxide
- eza
- atuin


for macOS:

- alacritty
- aerospace
- sketchybar
- sesh


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
- **topic/path.zsh**: Any file named `path.zsh` is loaded first (before loading plugins and `compinit`) and is
  expected to setup `$PATH` or similar.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.

## install

Clone:

```bash
git clone https://github.com/Lynstery/dotfiles.git ~/.dotfiles
```


Install dotfiles:

```bash
cd ~/.dotfiles
script/install
# update_all=true script/install
```
