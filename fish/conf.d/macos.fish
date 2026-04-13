# MacOS specific configuration

if test (uname) = Darwin
    set -p PATH "$HOME/Library/Application Support/Coursier/bin"
    set -p PATH /Applications/sbt/bin
    set -p PATH /Applications/Racket_Current/bin/


    ###############################
    # Homebrew		      #
    ###############################

    set -gx HOMEBREW_PREFIX /usr/local
    set -gx HOMEBREW_CELLAR /usr/local/Cellar
    set -gx HOMEBREW_REPOSITORY /usr/local/Homebrew
    set -p PATH /opt/homebrew/sbin
    set -p PATH /opt/homebrew/bin
end
