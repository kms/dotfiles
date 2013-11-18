# ~/.zshenv
# Karl-Martin Skontorp <kms@skontorp.net> ~ http://22pf.org/

path=(/bin /usr/bin /sbin /usr/sbin)
path=($path /usr/X11R6/bin /usr/games /usr/local/bin)
path=($path $HOME/bin)
path=($path $HOME/bin/android-sdk-linux/tools)
path=($path $HOME/bin/eclipse)
path=($path $HOME/bin/weechat/bin)
path=($path $HOME/bin/gems/bin)
path=($path $HOME/bin/gems/lib/ruby/gems/1.8/bin/)
path=($path $HOME/bin/astrometry.net/bin/)
export PATH

export GEM_HOME=$HOME/bin/gems/lib/ruby/gems/1.8
export RUBYLIB=$HOME/bin/gems/lib:$HOME/bin/gems/lib/site_ruby/1.8

export VISUAL="/usr/bin/vim -X"
export RSYNC_RSH=ssh
export TZ='Europe/Oslo'

export GDK_NATIVE_WINDOWS=true # For Android SDK

export LANG=nb_NO.utf8
export LANGUAGE=
export LC_CTYPE="nb_NO.utf8"
export LC_NUMERIC="en_US.utf8"
export LC_TIME="en_US.utf8"
export LC_COLLATE="nb_NO.utf8"
export LC_MONETARY="nb_NO.utf8"
export LC_MESSAGES="en_US.utf8"
export LC_PAPER="nb_NO.utf8"
export LC_NAME="nb_NO.utf8"
export LC_ADDRESS="nb_NO.utf8"
export LC_TELEPHONE="nb_NO.utf8"
export LC_MEASUREMENT="nb_NO.utf8"
export LC_IDENTIFICATION="nb_NO.utf8"
export LC_ALL=
