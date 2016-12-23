# env
export LANG="ja_JP.UTF-8"
export LC_MESSAGES=C
export LC_TIME=C
export DATE=`date +%F`
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:/usr/games
export EDITOR=vim
# general
setopt transient_rprompt
autoload -U compinit; compinit
autoload -U colors; colors
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt list_packed 
setopt nolistbeep 
setopt noautoremoveslash
setopt complete_aliases
# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_reduce_blanks
bindkey -e
# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 
# change prompt color based on whether gnu screen is active
if [ $STY ]
then
    PROMPT=$'%{\e[31m%}%%%{\e[0m%} '
else
    PROMPT=$'%% '
fi
# d.hatena.ne.jp/uasi/20091017/1255712789
function rprompt-git-current-branch {
    local name st color
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi
    name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
    if [[ -z $name ]]; then
        return
    fi
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=${fg[green]}
    elif [[  -n `echo "$st" | grep "^nothing added"` ]]; then
        color=${fg[yellow]}
    elif [[  -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=${fg_bold[red]}
    else
        color=${fg[red]}
    fi
    echo "%{$color%}$name%{$reset_color%} "
}
setopt prompt_subst
RPROMPT='[`rprompt-git-current-branch`%~]'
# alias
alias less="less -iR"
alias pureless="less"
alias grep="grep --color=always"
export GREP_COLORS="fn=32:mt=01;31";
# 2015-08-09 for OSX
# cf. $brew install coreutils
alias ls="gls --color"
# 2014-10-06 initial setup for Geant4
# alias g4init="cd /usr/local/bin/ ; source geant4.sh ; cd -"
# 2015-08-09 
# http://qiita.com/sutoh/items/296b1277b00beae87106
# alias tmux="tmux -2"
# 2015-08-30
alias nap="sudo shutdown -s"
# 2015-09-01
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
    z --add "$(pwd -P)"
}
# 2015-10-20
alias xdssh="ssh nethack@xd.cm"
# perl5 settings that I hate
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
# colorized man
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;36m") \
        LESS_TERMCAP_md=$(printf "\e[1;32m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;36m") \
    man "$@"
}
