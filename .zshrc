# global env settings
export TERM="xterm-256color"
export EDITOR=joe
export LESS='-R'
#export LSCOLORS='gxfxdxdxCxbDfDCbCgGhGx'
export LANG='en_US.UTF-8'

# alias block
alias ll='ls -al'
alias lh='ls -alh'
alias g='egrep -d skip -In --'
alias gv='egrep -d skip -Iv --'
alias wcl='wc -l'

# fix ssh forwarding for tmux
if [[ -n "$SSH_TTY" && -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# zsh:history
setopt append_history
setopt share_history
setopt extended_history
setopt histignoredups
setopt histignorespace
setopt histfindnodups

export HISTSIZE=2000000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.zsh_history"

# zsh:silence
setopt nobeep

# zsh:no paste noise
zle_highlight+=(paste:none)

# zsh:autocomplete
autoload -U compinit && compinit

# zsh:vi mode
bindkey -v

# zsh:search shortcut
bindkey "^R" history-incremental-pattern-search-backward

# essembeh  jnrowe jaischeema afowler

# zsh:customize oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh_custom"
export ZSH_THEME="randir"

# zsh:no oh-my-zsh. autoupdates
DISABLE_AUTO_UPDATE="true"

# zsh:faster work with repositories
DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh plugins
plugins=(git debian svn tmux safe-paste nmap history history-substring-search)

source $ZSH/oh-my-zsh.sh
