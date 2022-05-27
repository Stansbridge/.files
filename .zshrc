alias vim="nvim"

alias ls="ls -alG"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export PATH="$HOME/Tizen/tizen-studio/tools:$HOME/go/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

bindkey -v

#source "$HOME/.local/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
#
source "$HOME/.local/share/zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT


function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      # Something you want to do...
      export PROMPT="%F{cyan}>>%F{yellow}%B[%3~]%f %(?.%F{green}+.%F{red}-)%f%b %# "
    ;;
    $ZVM_MODE_INSERT)
      # Something you want to do...
      export PROMPT="%F{yellow}%B[%3~]%f %(?.%F{green}+.%F{red}-)%f%b %# "
    ;;
    $ZVM_MODE_VISUAL)
      # Something you want to do...
      export PROMPT="%F{cyan}||%F{yellow}%B[%3~]%f %(?.%F{green}+.%F{red}-)%f%b %# "
    ;;
    $ZVM_MODE_VISUAL_LINE)
      # Something you want to do...
      export PROMPT="%F{yellow}%B[%3~]%f %(?.%F{green}+.%F{red}-)%f%b %# "
    ;;
    $ZVM_MODE_REPLACE)
      # Something you want to do...
      export PROMPT="%F{yellow}%B[%3~]%f %(?.%F{green}+.%F{red}-)%f%b %# "
    ;;
  esac
}
