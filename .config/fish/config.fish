if status is-interactive
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    set -g fish_greeting
    # Commands to run in interactive sessions can go here
    if test -d /opt/spack
        source /opt/spack/share/spack/setup-env.fish
    end

    fish_add_path $HOME/.cargo/bin
end
