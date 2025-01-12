# TODO: 
Declare colors in a var an pass them around 

look for info [here](https://mynixos.com/home-manager/options/programs.tmux)
 Try setting some of those:
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CACHE_DIRS="${HOME}/.cache"
export XDG_CACHE_DIR="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="${HOME}/.config"
export XDG_CONFIG_DIR="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/share"
export XDG_DATA_DIRS="${HOME}/share"
export XDG_DATA_DIR="${HOME}/share"
export XDG_STATE_HOME="${HOME}/state"
export XDG_STATE_DIRS="${HOME}/state"
export XDG_STATE_DIR="${HOME}/state"
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_BIN_DIRS="${HOME}/.local/bin"
export XDG_BIN_DIR="${HOME}/.local/bin"
export XDG_RUNTIME_HOME="${HOME}/.run"
export XDG_RUNTIME_DIRS="${HOME}/.run"
export XDG_RUNTIME_DIR="${HOME}/.run"

export NIX_STORE_DIR="/nix/store"
export NIX_DATA_DIR="/nix/var/nix/db"
export NIX_LOG_DIR="/nix/var/log/nix"
export NIX_STATE_DIR="/nix/var/nix"
export NIX_CONF_DIR="${XDG_CONFIG_HOME}/nix"
export NIX_CONF_DIR="${XDG_CONFIG_DIRS}/nix"
export NIX_CONF_DIR="${XDG_CONFIG_DIR}/nix"
export NIX_PROFILES="/nix/var/nix/profiles"
