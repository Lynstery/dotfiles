# basic plugins

zinit snippet OMZL::functions.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZP::extract

# additional completions added in fpath
zinit light zsh-users/zsh-completions

# vi-mode
zinit light jeffreytse/zsh-vi-mode

function zvm_after_init() {
  eval "$(atuin init zsh --disable-up-arrow)"
}

# smart ls (eza)
zinit ice wait lucid
zinit snippet OMZP::eza

# smart cd (zoxide)
export ZOXIDE_CMD_OVERRIDE="cd"
zinit ice wait lucid
zinit snippet OMZP::zoxide

# better history (history-search-multi-word)
#zinit ice wait lucid
#zinit light zdharma-continuum/history-search-multi-word

# autosuggestions
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# fzf-tab
zinit ice wait lucid
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*'          fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*'  fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*'           fzf-preview 'eza --icons -1 --color=always $realpath'

# syntax-highlighting
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# spaceship-prompt
#zinit ice wait lucid atload'prompt_spaceship_precmd'
zinit light spaceship-prompt/spaceship-prompt
