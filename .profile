# shell options

shopt -s histappend # append instead of overwrite history
shopt -s cmdhist    # properly save multi-line commands
shopt -s lithist    # don't replace newlines with semicolons in history
shopt -s cdspell    # fix typos when changing directories

# history

export HISTFILESIZE=2000 # write more history
export HISTSIZE=2000     # remember more history


# colors

export RESET='\e[0m'
export BLACK='\e[0;30m'
export RED='\e[0;31m'
export GREEN='\e[0;32m'
export YELLOW='\e[0;33m'
export BLUE='\e[0;34m'
export PURPLE='\e[0;35m'
export CYAN='\e[0;36m'
export WHITE='\e[0;37m'

export CLICOLOR=1

# aliases

alias ll="ls -al"
alias ..="cd .."
alias aircrack="aircrack-ng -f 16 -x2 /tmp/*.cap"

# completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

. ~/.local/git-completion.sh

# path

export PATH="$PATH:~/bin"

# prompt

function shorten_prompt_cwd {
    CWD=$(echo "$PWD" | sed -e "s,^$HOME,~,")
    # leave the first 10 characters alone
    echo -n "${CWD:0:10}"
    # truncate intermediate directories in the remaining string
    echo "${CWD:10}" | sed -e "s,\([.]*[^/]\)\([^/]*\)/,\1…/,g"
}

export PS1="\n\[${BLUE}\][ \$( shorten_prompt_cwd )\[${GREEN}\]\$(__git_ps1 ' ± %s') \[${BLUE}\]] \[${YELLOW}\]⚡\[${RESET}\] "