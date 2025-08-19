# 2025-08-19 grammatical modification (use zsh array)
typeset -U path
path=("$HOME/.bin" "$HOME/.cargo/bin" "$HOME/perl5/bin" $path)
path=(/usr/games /snap/bin $path)

# 2023-07-25 settings for fcitx-mozc
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx

# 2024-07-04 settings for local libraries
# 2025-08-19 grammatical modification (handle empty/unset case)
LD_LIBRARY_PATH="/usr/local/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export LD_LIBRARY_PATH
