alias vim="nvim"

alias ls="ls -alG"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export PATH="$HOME/Tizen/tizen-studio/tools:$HOME/go/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

bindkey -v

#source "$HOME/.local/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
#
source "$HOME/.local/share/zsh-plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

export PROMPT="%F{cyan}${MODE_INDICATOR_PROMPT}%F{yellow}%B[%3~]%f %(?.%F{green}+.%F{red}-)%f%b %# "
