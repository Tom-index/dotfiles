# -----------------------------
# 環境変数
# -----------------------------
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# 先にHomebrewのパスを指定し、自動インストールを避ける
export PATH=$PATH:/opt/homebrew/bin

# -----------------------------
# Homebrew & oh-my-zsh 自動インストール
# -----------------------------

# Check if the OS is macOS and if Homebrew is installed
if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Installing now..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Check if oh-my-zsh is installed
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        echo "oh-my-zsh not found. Starting installation."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
fi

# -----------------------------
# oh-my-zsh
# -----------------------------

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# -----------------------------
# Prompt
# -----------------------------
PROMPT="
[%{$terminfo[bold]%}\
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}TomMac \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}]\
${hg_info}\
${git_info}\
${svn_info}\
${venv_info}\
 \
[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

# -----------------------------
# General
# -----------------------------

# ビープ音を鳴らさないようにする
setopt no_beep
  
# コマンドのスペルチェックをする
setopt correct

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

# Load local settings
[ -f ~/.zsh_local ] && source ~/.zsh_local