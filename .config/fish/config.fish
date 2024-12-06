if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    set -g fish_greeting
    set -gx EDITOR nvim

    fish_add_path /home/linuxbrew/.linuxbrew/opt/node@20/bin
    fish_add_path -a /usr/local/cuda/bin
    fish_add_path -a /home/felliu/.local/bin

    set -gx CUDA_PATH /usr/local/cuda

    starship init fish | source
end

# Created by `pipx` on 2024-10-14 09:48:40
set PATH $PATH /home/felliu/.local/bin
