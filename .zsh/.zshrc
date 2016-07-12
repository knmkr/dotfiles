fpath=($ZDOTDIR/functions(N-/) $fpath)

autoload -Uz is-at-least

# Prompt
autoload colors
colors
case ${UID} in
0)
    PROMPT="%B%{${fg[black]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[black]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[black]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    PROMPT="%{${fg[black]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[black]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[black]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30:*.py=00;32'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30:*.py=00;32'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

case $OSTYPE in
  darwin*|linux*)
    # http://mollifier.hatenablog.com/entry/20090814/p1
    # display VCS(git/hg/svn/...)-[branch]
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git hg svn
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    RPROMPT="%1(v|%F{green}%1v%f|)"
  ;;
esac

# Keybind
bindkey -e  # emacs like keybind

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

stty intr '^C'
stty susp '^Z'
# bindkey '^U' backward-kill-line
# bindkey '^W' kill-region
# bindkey '^[h' vi-backward-kill-word
# bindkey '^[.' copy-prev-word
# bindkey '^O' vi-open-line-below


# Alias
alias where="command -v"
alias j="jobs -l"
alias l="ls"
alias sl="ls"
alias la="ls -lha"
alias lt="ls -lht"
alias lx="ls -lhx"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias nkf='nkf -w'


# History
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history


# Completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'        # case-insensitive
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'            # smart-case
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}  # ls-colors
setopt complete_aliases
setopt magic_equal_subst                                         # --prefix=/usr などの = 以降も補完
setopt correct                                                   # command correct edition before each completion attempt
setopt list_packed                                               # compacked complete list display
# setopt auto_menu                                               # TAB で順に補完候補を切り替える


# Misc.
export EDITOR="emacs"
export LESS='-R'               # --RAW-CONTROL-CHARS
setopt noautoremoveslash       # no remove postfix slash of command line
setopt nolistbeep              # no beep sound when complete list displayed
setopt multios                 # 複数のリダイレクトを記述できる
setopt extended_glob
setopt long_list_jobs
# setopt equals                # =command を command のパス名に展開する
# setopt auto_param_keys
umask 022                      # 新しくファイルを作成する際に、許可しないビットを示す
unlimit
limit -s
watch="all"                    # 全てのユーザのログイン・ログアウトを監視
log                            # ログイン時にはすぐに表示する
setopt interactivecomments     # コマンドライン実行時もコメントを使えるようにする

# bundler
alias be='bundle exec'

# emacs
alias e="emacs"


# Utils
# http://d.hatena.ne.jp/itchyny/20130227/1361933011
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# http://blog.iss.ms/2011/07/08/193128
# hs [-nnnnn] word1 word2 ...
function hs () {
    n_hist_default=1000000

    n_hist=${1#-}

    if [ $1 != ''  -a  $n_hist != $1 ]; then
        shift

        if [ $n_hist -gt 0 ]; then
        else
            n_hist=$n_hist_default
        fi
    else
        n_hist=$n_hist_default
    fi

    words=($*)

    greps=""
    for w in $words; do
        greps="${greps} | grep ${w}"
    done

    # echo n: $n_hist
    # echo w: $words

    eval "history -${n_hist} ${greps}"
}

# function hs-all { history -E 1 }

# function recho { echo -e "\e[31m$*\e[m"; }
# function gecho { echo -e "\e[32m$*\e[m"; }
# function yecho { echo -e "\e[33m$*\e[m"; }
# function becho { echo -e "\e[34m$*\e[m"; }

# tcshのsetenvコマンド
# function setenv() { export $1=$2 }

# # Compile
# function runcpp () { g++ $1 && shift && ./a.out $@ }
# alias -s {c,cpp}=runcpp

# # Run simple HTTP server on current dir
# function runserver() {
#     python -m SimpleHTTPServer $1
# }


# Load OS-dependent settings
case $OSTYPE in
    darwin*)
        . $ZDOTDIR/.zshrc.Darwin
        ;;
    linux*)
        . $ZDOTDIR/.zshrc.Linux
        ;;
    cygwin*)
        . $ZDOTDIR/.zshrc.Cygwin
        ;;
esac


# Software
# ruby, rbenv
if [ -d ${HOME}/.rbenv ]; then
    if [ -d ${HOME}/.rbenv/bin ]; then
        RBENV_HOME="${HOME}/.rbenv"
    elif [ -d ${BREW_HOME}/Cellar/rbenv ]; then
        RBENV_VERSION=$(rbenv --version| cut -d' ' -f2)
        RBENV_HOME="${BREW_HOME}/Cellar/rbenv/${RBENV_VERSION}"
    fi

    export PATH="${RBENV_HOME}/bin:$PATH"

    eval "$(rbenv init -)"
    . ${RBENV_HOME}/completions/rbenv.zsh

    export PATH="${RBENV_HOME}/shims:$PATH"
fi

# svn
svn() {
    if [ "$1" = "log" ]
    then
        command svn "$@" | less -FX
    else
        command svn "$@"
    fi
}


# `cd`
setopt auto_cd             # ディレクトリ名と一致した場合 cd
# setopt autopushd
# setopt pushd_ignore_dups　

# Bind `M-i` to `cd ..`
cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '^[i' cdup

# http://stackoverflow.com/questions/18212540/avoid-an-ls-style-listing-on-actvation-virtualenv-wrapper
# always `ls` after `cd` (except activate virtualenv)
# Note: place this function after `ls` settings
function cd() {
    if [ -n "$1" ]; then
        case "$1" in
            "$HOME/.virtualenvs")
                :
                ;;
            *)
                builtin cd $@ && ls
                ;;
        esac
    else
        builtin cd ~ && ls
    fi
}

# http://qiita.com/scalper/items/4728afaac9962bf91bfa
# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# zaw - zsh anything.el-like widget
# git://github.com/zsh-users/zaw.git
if [ -f $ZDOTDIR/zaw/zaw.zsh ]; then
    source $ZDOTDIR/zaw/zaw.zsh
    zstyle ':filter-select' case-insensitive yes
    bindkey '^[/' zaw-cdr
    bindkey '^[;' zaw-gitdir        # git管理下(カレントより親も含む)のディレクトリ一覧表示, 選択すると移動
    bindkey '^[b' zaw-git-branches  # gitのブランチ一覧表示, 選択するとcheckout

    function zaw-src-gitdir () {
        _dir=$(git rev-parse --show-cdup 2>/dev/null)
        if [ $? -eq 0 ]
        then
            candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
        fi
        actions=("zaw-src-gitdir-cd")
        act_descriptions=("change directory in git repos")
    }

    function zaw-src-gitdir-cd () {
        BUFFER="cd $1"
        zle accept-line
    }
    zaw-register-src -n gitdir zaw-src-gitdir
fi

# Enter で ls と git status を表示する
# //github.com/kyanagi/dot.zsh.d/blob/1d0e7d0613d5455d7a31873d6c7326f855518892/zshrc
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    eval ls  # alias を展開したい
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter
bindkey '^j' do_enter

# zsh-syntax-highlighting
#
# Fish shell-like like syntax highlighting for Zsh.
# git://github.com/zsh-users/zsh-syntax-highlighting.git
if [ -f $ZDOTDIR/zaw/zaw.zsh ]; then
    source  $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Load local settings
[ -f ~/.zshrc.mine ] && . ~/.zshrc.mine
