# zinit plugins

zinit light zsh-users/zsh-completions

zinit snippet OMZL::functions.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZP::extract

# smart ls
zinit snippet OMZP::eza

# smart cd（zoxide）
export ZOXIDE_CMD_OVERRIDE="cd"
zinit snippet OMZP::zoxide

autoload -Uz compinit
compinit -C
zinit cdreplay -q

zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*'          fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*'  fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*'           fzf-preview 'eza --icons -1 --color=always $realpath'

zinit light zdharma-continuum/history-search-multi-word
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"
zstyle ":history-search-multi-word" page-size "30"
bindkey -M emacs '\er' history-search-multi-word
bindkey -M viins '\er' history-search-multi-word
bindkey -M vicmd '\er' history-search-multi-word

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light spaceship-prompt/spaceship-prompt
zinit light jeffreytse/zsh-vi-mode
