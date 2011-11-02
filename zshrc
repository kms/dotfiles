# ~/.zshrc
# Karl-Martin Skontorp <kms@skontorp.net> ~ http://22pf.org/

unlimit
limit stack 8192
limit core 0
limit -s
umask 022

alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias rm='nocorrect rm'
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias grep='egrep --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias ls='ls --color --classify'
alias nslookup='false'
alias vim='vim -X'
alias less='zless'
alias rpn='rpncalc'

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# List only file beginning with "."
alias lsa='ls -ld .*'

# Shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# Set prompts
PROMPT='[%m:%#] ' #default prompt
RPROMPT='[%~]' # prompt for right side of screen

HISTSIZE=32768
SAVEHIST=32768
HISTFILE=~/.zshhist
DIRSTACKSIZE=20

# Watch for my friends
watch=(notme)                   # watch for everybody but me
LOGCHECK=60                     # check every 1 min for login/logout activity
WATCHFMT='%n %a %l from %m at %t.'

# Set/unset  shell options
setopt   notify globdots correct pushdtohome automenu appendhistory
setopt   correctall recexact longlistjobs nobeep extendedhistory
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

bindkey -e

bindkey ' ' magic-space  # also do history expansino on space
autoload up-line-or-beginning-search 
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search 
zle -N down-line-or-beginning-search
bindkey "[A" up-line-or-beginning-search
bindkey "[B" down-line-or-beginning-search

# Xterm window title
precmd() {
    [[ -t 1 ]] || return
	case $TERM in
	*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%n@%m:%~\a"
	;;
    esac
}

# Autoload things
autoload -U compinit
compinit

autoload -U promptinit
promptinit

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists
zstyle ':completion:*:processes' command 'ps U $USER -o pid,s,nice,stime,args'

# Get hostnames from ~/.hosts for completion
hosts=(${${${${(f)"$(<$HOME/.hosts)"}:#[0-9]* }%%\ *}%%,*})
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro' '.svn/'

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
