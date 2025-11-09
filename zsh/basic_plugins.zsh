# basic plugins

zinit snippet OMZL::functions.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZP::extract

# additional completions added to fpath
zinit light zsh-users/zsh-completions

# vi-mode
ZVM_INIT_MODE=sourcing
zinit light jeffreytse/zsh-vi-mode

# smart ls (eza required)
zinit ice wait lucid
zinit snippet OMZP::eza

# smart cd (zoxide required)
export ZOXIDE_CMD_OVERRIDE="cd"
zinit ice wait lucid
zinit snippet OMZP::zoxide

# autosuggestions
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# fzf-tab (fzf required)
zinit ice wait lucid
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*'          fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*'  fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*'           fzf-preview 'eza --icons -1 --color=always $realpath'

# syntax-highlighting
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting
