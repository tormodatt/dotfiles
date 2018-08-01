# Paths
#
export GOPATH=$HOME/go

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/git/ambita/util/commands"
export PATH="$PATH:$GOPATH/bin"

export LANG=en_US.UTF-8 LC_CTYPE="en_US.UTF-8"

# # BobTheFish theme
set -g theme_color_scheme gruvbox
set theme_display_vagrant yes
set -g theme_nerd_fonts yes
#
# Autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish


# Useful aliases
#
#alias set portinuse=(sudo lsof -i -n -P | grep TCP)
alias conambita="sudo openvpn --script-security 2 --config config.ovpn.bak"
alias flushdns="sudo killall -HUP mDNSResponder"
alias ecrlogin="eval (aws ecr get-login --no-include-email)"
alias fishit="vim ~/.config/fish/config.fish; source ~/.config/fish/config.fish"
alias ql="qlmanage -p $argv 2> /dev/null"
alias recent="cd ~/Downloads; ls -1t | head -5"

function img
    curl -Ls $argv | imgcat
end

# Vim
alias wiki="vim -c 'call feedkeys(\"\<Plug>(wiki-index)\")'"
alias vi="vim"

thefuck --alias | source


export PYSPARK_PYTHON="/usr/local/bin/python3"


bind yy fish_clipboard_copy
bind p fish_clipboard_paste
