#############################
# Setting the PATH variable #
#############################

# OS agnostic paths
set -p PATH $HOME/.cargo/bin
set -p PATH $HOME/.cabal/bin
set -p PATH $HOME/esp/xtensa-esp32-elf/bin
set -p PATH $HOME/.local/bin
set -p PATH $HOME/tools/android-sdk/bin
set -p PATH $HOME/bram/go/bin
set -p PATH $HOME/.npm/bin
set -p PATH /usr/local/go/bin
set -p PATH $HOME/.cargo/bin
set -p PATH "$HOME/.local/share/coursier/bin"
set -p PATH $HOME/go/bin
set -p PATH $HOME/.kubescape/bin
set -p PATH $HOME/.cache/rebar3/bin

# make it an environment variable
set -x PATH $PATH

###############################
# Other environment variables #
###############################

set -x EDITOR nvim
set -x MANPAGER "nvim +Man!"

##################
# Global aliases #
##################

# alias pbcopy="xclip -selection clipboard"
alias ssu="sudo"
alias ssh="env TERM=xterm ssh"
alias ccl="cargo check --color always 2>&1 | less -r"
alias ip="ip -c"
# alias tmux="env TERM=screen-256color-bce tmux"
alias attach="tmux a -t"
alias svim="/usr/local/bin/nvim -S .vimsession.vim"
alias watchlatex "find . -name \"*.tex\" | entr latexmk -pdf -shell-escape -synctex=1 -interaction=nonstopmode"
alias nv "nvim (fzf)"
alias tf terraform

########################
# Global Abbreviations #
########################

abbr --add kubepods "kubectl get pods"
abbr --add kubelogs "kubectl logs"
abbr --add gm "git commit -m"
abbr --add ga "git add"
abbr --add ccc "cargo check"
abbr --add ccb "cargo build"
abbr --add cct "cargo test"
abbr --add ns nix-shell
abbr --add a attach
abbr --add gp "git push"
abbr --add gP "git pull"
abbr --add e $EDITOR

# On some systems we need to start the SSH agent
# ourselves, but we cannot do it for non-interactive
# sessions as it would mess up other protocols such as 
# scp (but not SFTP)
if status --is-interactive
    eval (ssh-agent -c)
end

#################################################
# Programming language-specific env variables
#################################################

# Ocaml
source $HOME/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

# Haskell
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/bram/.ghcup/bin $PATH


