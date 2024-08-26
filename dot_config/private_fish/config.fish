if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
end

set -l ghcup $HOME/.ghcup
set -q GHCUP_INSTALL_BASE_PREFIX and set ghcup $GHCUP_INSTALL_BASE_PREFIX/.ghcup

set -x DENO_INSTALL $HOME/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
set -x NNN_PLUG "j:autojump"
fish_add_path -pmP $ghcup/bin
fish_add_path -pmP $HOME/.cabal/bin
fish_add_path -pmP $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path /usr/bin
fish_add_path -pmP $HOME/bin
fish_add_path ~/.config/emacs/bin/
fish_add_path ~/.local/bin/
fish_add_path ~/pypr-env/bin/
# pnpm
set -gx PNPM_HOME "/home/martini/.local/share/pnpm"
set -gx BKMR_DB_URL /home/martini/bookmarks
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Some config
set -g fish_greeting

set -g man_underline -u $blue

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Exports
set -gx VISUAL nvim
set -gx EDITOR emacsclient -r
set -gx QT_QPA_PLATFORM wayland

abbr -a only-secondary-monitor "hyprctl keyword monitor HDMI-A-1, preffered, 0x0, 1 && hyprctl keyword monitor eDP-1, disable"
abbr -a only-primary-monitor "hyprctl keyword monitor eDP-1, preffered, 0x0, 1 && hyprctl keyword monitor HDMI-A-1, disable"
abbr -a dual-monitor "hyprctl keyword monitor eDP-1, preffered, 960x2160, 1 && hyprctl keyword monitor desc:AOC U28P2G6B PCSN1JA000129, preffered, 0x0, 1"

alias ls='ls -pv --color=auto --group-directories-first'
alias lsa='ls -pvA --color=auto --group-directories-first'
alias lsl='ls -lhpv --color=auto --group-directories-first'
alias lsla='ls -lhpvA --color=auto --group-directories-first'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

set MOZ_ENABLE_WAYLAND 1
set XDG_CURRENT_DESKTOP sway

# Created by `pipx` on 2022-09-11 05:02:32
# set PATH $PATH /home/flicko/.local/bin

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /home/martini/.ghcup/bin # ghcup-env
# starship init fish | source
# zoxide init fish | source
