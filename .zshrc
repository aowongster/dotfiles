#!/usr/bin/env zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
bindkey " " magic-space # history expansion on space
stty -ixon # disable Ctrl-S/Ctrl-Q
path=(~/bin /usr/local/cuda/bin ~/android/android-sdk-linux_86 ~/bin/gsutil $JAVA_HOME/bin $path)
fpath=(~/.zsh $fpath)
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select=5
#bindkey -M menuselect '^o' accept-and-infer-next-history # doesn't work for some reason
zstyle ':completion:*' urls ~/.zshrc/urls

setopt auto_list list_ambiguous list_packed
#setopt correct complete_aliases complete_in_word alwaystoend
setopt auto_param_keys auto_param_slash
setopt auto_cd equals
setopt hash_cmds hash_dirs
setopt hist_ignore_space hist_ignore_dups hist_find_no_dups
setopt append_history # share_history
setopt extended_glob # enables ^x x~y x# x##
setopt extended_history

if [ "$TERM" != "dumb" ]; then
  if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors)"
    alias ls='ls -F --color=auto'
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  fi
  if [ -x /usr/bin/lesspipe ]; then
    eval "$(lesspipe)" # http://www.cyberciti.biz/tips/less-is-more-the-hidden-treasure-of-less-command.html
  fi

  autoload colors zsh/terminfo
  colors
  for color in red green blue yellow magenta cyan white; do
    eval c_$color='%{$fg[$color]%}'
    eval c_l$color='%{$terminfo[bold]$fg[$color]%}'
  done
  c_none="%{$terminfo[sgr0]%}"

  local prompt_user="%(!.$c_lred.$c_lgreen)%n$c_none"
  local prompt_host="%(!.$c_lred.$c_lgreen)%m$c_none"
  #local prompt_host="$c_lyellow%m$c_none"
  local prompt_cwd="$c_lwhite%40<..<%~%<<$c_none"
  local prompt_time="$c_blue%*$c_none"
  local prompt_ecode="%(?..$c_lred%?$c_none )"

  PROMPT="$prompt_host:$prompt_cwd %# "
# PROMPT="$prompt_user%B@%b$prompt_host:$prompt_cwd %# "
  RPROMPT="$prompt_ecode$prompt_time"
fi

export LUA_INIT=@$HOME/bin/init.lua
export PAGER=less
export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export PYTHONPATH=$PYTHONPATH:$HOME/gsutil/boto

unset http_proxy
# aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias g=grep
alias m=less
source ~/.aliases

#alias m=make
alias e='emacs -nw'
function dupscreen { screen bash -c "cd \"$PWD\" && exec $SHELL --login" }
alias ,d=dupscreen
alias relcom='f=(~/.zsh/*(.)); unfunction $f:t; autoload -U ~/.zsh/*(:t)'

#functions
emacs () { /usr/bin/emacs $* 2>/dev/null & }

umask 0022

[ -r ~/.zshrc.local ] && source ~/.zshrc.local
