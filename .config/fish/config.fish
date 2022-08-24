if status is-interactive
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    set -g fish_greeting
    # Commands to run in interactive sessions can go here
    if test -d /opt/spack
        source /opt/spack/share/spack/setup-env.fish
    end

    fish_add_path $HOME/.cargo/bin
    
    #Gurobi related files (Gurobi installed under /opt/gurobi951
    set -x GUROBI_HOME /opt/gurobi951/linux64
    set PATH $PATH $GUROBI_HOME/bin
    set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH $GUROBI_HOME/lib
    set -x CPLUS_INCLUDE_PATH $CPLUS_INCLUDE_PATH $GUROBI_HOME/include
end
