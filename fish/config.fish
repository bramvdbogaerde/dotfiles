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

# make it an environment variable
set -x PATH $PATH

###############################
# Other environment variables #
###############################

# set -x IDF_PATH  $HOME/esp/esp-idf
set -x EDITOR    nvim

##################
# Global aliases #
##################

alias pbcopy="xclip -selection clipboard"
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
alias attach="tmux a -t"

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
abbr --add ns "nix-shell"
abbr --add a "attach"

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

if status --is-interactive
eval (ssh-agent -c)
end

any-nix-shell fish --info-right | source


