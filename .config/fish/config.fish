if status is-interactive
    set -g fish_greeting
    # Commands to run in interactive sessions can go here
    if test -d /opt/spack
        source /opt/spack/share/spack/setup-env.fish
    end

    fish_add_path $HOME/.cargo/bin

    set -gx EDITOR nvim

    starship init fish | source
end

# For Valgrind to work
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/felixliu/.ghcup/bin # ghcup-env



set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/felixliu/.ghcup/bin $PATH # ghcup-env