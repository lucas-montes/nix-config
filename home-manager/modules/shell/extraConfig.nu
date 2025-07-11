let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

def _fzf [...args: string] {
  find ...$args (-name ".direnv" -o -name ".venv" -o -name "*cache*" -o -name ".git" -o -name "build" -o -name "target") -prune -o -type f -o -type d -print | fzf
}

def _new_project [] {
  cp $env.HOME/.dotfiles/templates/rust/{.gitignore,.envrc,flake.nix} .
}

def _fzf_tmux [...args: string] {
  _new_named_session (_fzf ...$args)
}

def _new_named_session [path: path] {
  if not ($path | path exists) {
    echo $"WTF ($path)"
    return 1
  }

  let name = ($path | path basename | str replace -a '.' '_')
  let dir_to_go = ($path | path expand)

  let tmux_running = (pgrep tmux | complete | $in.exit_code == 0)

  if ($env.TMUX? | is-empty) and not $tmux_running {
    tmux new-session -s $name -c $dir_to_go
    exit 0
  }

  if not (_tmux_has_session $name) {
    tmux new-session -ds $name -c $dir_to_go
  }

  if ($env.TMUX? | is-empty) {
    tmux attach-session -t $name
  } else {
    tmux switch-client -t $name
  }
}

def _tmux_has_session [name: string] {
  tmux list-sessions | grep -q $'^($name):'
  $env.LAST_EXIT_CODE == 0
}

$env.config = {
    show_banner: false,
    completions: {
    case_sensitive: false # case-sensitive completions
    quick: true    # set to false to prevent auto-selecting completions
    partial: true    # set to false to prevent partial filling of the prompt
    algorithm: "fuzzy"    # prefix or fuzzy
    external: {
    # set to false to prevent nushell looking into $env.PATH to find more suggestions
        enable: true
    # set to lower can improve completion performance at the cost of omitting some options
        max_results: 100
        completer: $carapace_completer # check 'carapace_completer'
    }
    }
}
