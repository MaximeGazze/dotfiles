if shopt -q login_shell; then
    export __GL_SHADER_DISK_CACHE_PATH=~/.cache/nv

    # PNPM
    export PNPM_HOME="/home/max/.local/share/pnpm"
    export PATH="$PATH:$PNPM_HOME"

    # RUST
    export PATH="$PATH:/home/max/.cargo/bin"

    # GO
    export PATH=$PATH:$(go env GOPATH)/bin

    [[ -f ~/.bashrc ]] && source ~/.bashrc
    [[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && exec startx
else
    exit 1 # Somehow this is a non-bash or non-login shell.
fi
