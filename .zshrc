export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_CHAR_SYMBOL="🐼 "
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_EXEC_TIME_SHOW="false"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  golang        # Go section
  rust          # Rust section
  haskell       # Haskell Stack section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

ENABLE_CORRECTION="true"
plugins=(git wd)

source $ZSH/oh-my-zsh.sh

setopt histignorespace
setopt hist_ignore_dups
SAVEHIST=9999999

alias gs='git status'
alias ll="exa --color auto --all --group-directories-first --long --group --header --modified --sort=name --git --time-style=long-iso --classify"
alias cact='conda activate'
alias cdeact='conda deactivate'
alias cswitch='conda deactivate && conda activate'

bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey -e
bindkey \^U backward-kill-line

export LC_ALL=en_US.UTF-8
export VIRTUAL_ENV_DISABLE_PROMPT=0

# the below is a function. functions are defined either by the word function, or by the syntax foo ()
# it calls git credential-osxkeychain and begins a HERE DOCUMENT, a way to put interactive content into a shell
# it uses <<, which means "keep listening until you see this character" (in this case the Unix special char EOF)
# $1 and $2 are the username and password args

switch_git_cred () {
git credential-osxkeychain erase <<EOF
host=github.com
protocol=https
EOF
git credential-osxkeychain store <<EOF
host=github.com
protocol=https
username=$1
password=$(<~/ghpw.txt)
EOF
if [ "$1" = "lordgrenville" ]; then
  git config --global user.username "lordgrenville" && git config --global user.email "16547083+lordgrenville@users.noreply.github.com"
elif  [ "$1" = "josh-friedlander-kando" ]; then
  git config --global user.username "josh-friedlander-kando" && git config --global user.email "josh@kando.eco"
fi
} 

# quick search downloaded epub: unzip latest file in Downloads, and (recursive, case-insensitive) grep for first argument
book () {
cd ~/Downloads
cp *(om[1]) foo.zip
unzip -fo foo.zip -d foo/
cd foo/
grep -RIi $1 .
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
export PATH="/usr/local/opt/libiconv/bin:$PATH"
