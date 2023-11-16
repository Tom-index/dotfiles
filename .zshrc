export PATH=$PATH:/opt/homebrew/bin

# fix commands' misspelling
setopt correct

# no beep
setopt no_beep

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tomo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tomo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tomo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tomo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# login in the same directory as the last time when exiting
export dirfile="$HOME/.who.$host.$tty"
export dirhfile="$HOME/.who.$host"
if [[ ! -f $dirfile  ]]; then
    if [[ ! -f $dirhfile  ]]; then
        dir=$HOME
    else
        dir=`cat $dirhfile`
    fi
else
    dir=`cat $dirfile`
    if [[ -d $dir  ]]; then
        cd $dir
    else
        dir=$HOME
    fi
fi
function pushd {
    builtin pushd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}
function popd {
    builtin popd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}
function cd {
    builtin cd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}