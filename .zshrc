# env
export LANG="ja_JP.UTF-8"
export LC_MESSAGES=C
export LC_TIME=C
export DATE=`date +%F`
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
    if [[ "$PWD" =~ '/lnk(/.*)?$' ]]; then
        return
    fi
    name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
    if [[ -z $name ]]; then
        return
    fi
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to commit"` ]]; then
        color=${fg[green]}
    elif [[  -n `echo "$st" | grep "Untracked files"` ]]; then
        color=${fg[red]}
    elif [[  -n `echo "$st" | grep "Changes to be commit"` ]]; then
        color=${fg[blue]}
    else
        color=${fg[yellow]}
    fi
    echo "%{$color%}$name%{$reset_color%} "
}
setopt prompt_subst
RPROMPT='[`rprompt-git-current-branch`%~]'
# alias
alias less="less -iR"
alias pureless="less"
alias grep="grep --color=always"
alias tmux="tmux -2"
export GREP_COLORS="fn=32:mt=01;31";
# 2014-10-06 initial setup for Geant4
# alias g4init="cd /usr/local/bin/ ; source geant4.sh ; cd -"
# 2015-08-09
# http://qiita.com/sutoh/items/296b1277b00beae87106
# alias tmux="tmux -2"
# 2015-08-30
alias nap="sudo shutdown -s"
# 2015-10-20
alias xdssh="ssh nethack@xd.cm"
# perl5 settings that I hate
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
        GROFF_NO_SGR=1 \
    man "$@"
}
# OS specific settings
case "${OSTYPE}" in
darwin*)
    # cf. $brew install coreutils
    alias ls="ls -G"
    ;;
linux-gnu*)
    alias ls="ls --color"
    # 2020-10-01 VcXsvr setting
    ### export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
    # 2024-01-23 X410 setting (in the case /etc/resolv.conf is not correct)
    if [ "${NAME:0:1}" = "L" ]; then
        export DISPLAY=$(ip route | grep default | awk '{print $3; exit;}'):0.0
    fi
    ### if [ "${NAME:0:1}" = "V" ]; then
    ###     export GDK_SCALE=2  # for 4K display
    ### fi
    ### ;;
esac

# 2017-09-27 setup for geant4
if [ -d $HOME/g4home ]; then
	g4init() {
		G4HOME=${HOME}/g4home/version/geant4
		cd ${G4HOME}/bin ; source geant4.sh ; cd -
	}
fi

# 2022-02-08 chemacs aliases
alias space="emacs --with-profile spacemacs"
alias dmacs="emacs --with-profile doom"

# 2022-09-29 ripgrep with cmigemo
# 2023-05-08 strict files to text documents
mrg(){
    cmigemo -q -d /usr/share/cmigemo/utf-8/migemo-dict -w $1 | xargs rg -p -g '*.txt' -g '*.md' -g '*.org' | less -R
    # cmigemo -q -d /usr/share/cmigemo/utf-8/migemo-dict -w $1 | xargs rg --glob '!*.html' --glob '!*.css'
}

# 2024-02-03 color setting for WinTerminal/Alacritty
export COLORTERM=truecolor
