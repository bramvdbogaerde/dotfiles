#############################
# Setting the PATH variable #
#############################

# Last path has the highest priority (prepend)

set -p PATH $HOME/.cargo/bin
set -p PATH $HOME/.cabal/bin
set -p PATH $HOME/esp/xtensa-esp32-elf/bin
set -p PATH $HOME/.local/bin
set -p PATH $HOME/tools/android-sdk/bin
set -p PATH $HOME/bram/tools/flutter/bin
set -p PATH $HOME/bram/go/bin
set -p PATH $HOME/.npm/bin
set -p PATH /usr/local/go/bin
set -p PATH $HOME/.gem/ruby/2.7.0/bin
set -p PATH /var/lib/snapd/snap/bin
set -p PATH $HOME/.cargo/bin
set -p PATH /Applications/sbt/bin
set -p PATH "$HOME/Library/Application Support/Coursier/bin"
set -p PATH "$HOME/.local/share/coursier/bin"
set -p PATH /Applications/Racket_Current/bin/
set -p PATH $HOME/go/bin/
set -p PATH $HOME/.ghcup/bin

# make it an environment variable
set -x PATH $PATH

###############################
# Homebrew		      #
###############################

set -gx HOMEBREW_PREFIX /usr/local
set -gx HOMEBREW_CELLAR /usr/local/Cellar
set -gx HOMEBREW_REPOSITORY /usr/local/Homebrew

set -p PATH /opt/homebrew/bin

###############################
# Nix
###############################

set -p PATH $HOME/.nix-profile/bin
set -x NIX_PATH $HOME/.nix-defexpr/channels
#set -x NIX_SSL_CERT_FILE $HOME/.nix-profile/etc/ssl/certs/ca-bundle.crt
set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt

###############################
# Other environment variables #
###############################

# set -x IDF_PATH  $HOME/esp/esp-idf
set -x EDITOR nvim

##################
# Global aliases #
##################

# alias pbcopy="xclip -selection clipboard"
alias ssu="sudo"
alias e="$EDITOR"
alias d="firefox --new-window doc.rust-lang.org/std/"
alias f='ranger'
alias ssh="env TERM=xterm ssh"
alias report="pdflatex -shell-escape report.tex"
alias ccl="cargo check --color always 2>&1 | less -r"
alias matlab="/data/bram/applications/matlab/bin/matlab -nodesktop"
alias matlabi="/data/bram/applications/matlab/bin/matlab"
alias scala-env="nix-shell /datapool/bram/nixcfgs/envs/scala/scala-env.nix"
alias maf="tmux source-file /home/bram/.tmux/maf.sh"
alias z3wasm="tmux source-file /home/bram/.tmux/z3wasm.sh"
alias thesis="tmux source-file /home/bram/.tmux/thesis.sh"
alias ip="ip -c"
alias tmux="env TERM=screen-256color-bce tmux"
alias attach="tmux a -t"
alias scheme="/Applications/Racket\ v8.2/bin/plt-r5rs"
alias svim="/usr/local/bin/nvim -S .vimsession.vim"
alias emsdk_setup ". $HOME/data/sources/emsdk/emsdk_env.fish"
alias watchlatex "find . -name \"*.tex\" | entr latexmk -pdf -shell-escape -synctex=1 -interaction=nonstopmode"
alias nv "nvim (fzf)"
alias tf terraform
alias hx helix

########################
# Global Abbreviations #
########################

abbr --add kubepods "kubectl get pods"
abbr --add kubelogs "kubectl logs"
abbr --add gm "git commit -m"
abbr --add ga "git add"
abbr --add gp "git push"
abbr --add ccc "cargo check"
abbr --add ccb "cargo build"
abbr --add cct "cargo test"
abbr --add ns nix-shell
abbr --add a attach
abbr --add gP "git pull"

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" >/dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

if status --is-interactive
    eval (ssh-agent -c)
end

# any-nix-shell fish --info-right | source
# eval (opam env)

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/bram/.ghcup/bin $PATH # ghcup-env

source /Users/bram/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
set -gx PATH $HOME/.cabal/bin /Users/bram/.ghcup/bin $PATH # ghcup-env
