export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/games
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;

# 2023-07-25 settings for fcitx-mozc
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx

# 2024-07-04 settings for local libraries
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
