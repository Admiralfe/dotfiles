if status is-interactive
    set -g fish_greeting
    # Commands to run in interactive sessions can go here
    if test -d /opt/spack
        source /opt/spack/share/spack/setup-env.fish
    end

    fish_add_path $HOME/.cargo/bin
    fish_add_path /usr/local/MATLAB/R2022b/bin
    fish_add_path $HOME/.local/bin
    fish_add_path /opt/cuda/bin

    set -gx CPATH /opt/cuda/include

    set -gx EDITOR nvim
    set -gx WORKON_HOME ~/.virtualenvs

    bass source /usr/bin/virtualenvwrapper_lazy.sh

    . /opt/spack/share/spack/setup-env.fish

    starship init fish | source
end

# For Valgrind to work
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/felixliu/.ghcup/bin # ghcup-env


