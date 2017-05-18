# global env settings
export TERM="xterm-256color"
export EDITOR=joe
export LESS='-R'
#export LSCOLORS='gxfxdxdxCxbDfDCbCgGhGx'
export LANG='en_US.UTF-8'
export CLICOLOR=1
export CLICOLOR_FORCE=1

# force homebrew to rebuild everything
export HOMEBREW_BUILD_FROM_SOURCE=1
# disable homebrew tracking bullshit
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# alias block
alias ll='ls -al'
alias lh='ls -alh'
alias g='egrep -d skip -In --'
alias gv='egrep -d skip -Iv --'
alias wcl='wc -l'
alias perl-bisect-make='git clean -dxf && ./Configure -de -Dusedevel && make -j5'

# fix ssh forwarding for tmux
if [[ -n "$SSH_TTY" && -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# set up perlbrew
if [ -d "$HOME/perlbrew" ]; then
    source $HOME/perlbrew/etc/bashrc
    perlbrew use perl-5.22.1
fi

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

# jaischeema afowler

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
