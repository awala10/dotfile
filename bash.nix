pkgs: {
  enable = true;
  enableCompletion = true;
  #enableLsColors =true;
  historySize = 10000;
  historyControl = [
    "erasedups"
    "ignoredups"
    "ignorespace"
  ];
  historyIgnore = [
    "ls *"
    "exit"
    "history *"
    "tree *"
    "cd *"
  ];
  shellAliases = {
    #ls = "exa -l --icons";
    rebuild = "sudo nixos-rebuild switch";
    re-edit = "sudoedit /etc/nixos/configuration.nix";
  };
  bashrcExtra = ''
    shopt -s autocd
      '';
  initExtra = ''
    set -o vi
    export EDITOR=vim
    export XDG_CONFIG_HOME="$HOME/.config"
    [[ $TERM != "screen" ]] && exec tmux
   if [ -z "$TMUX" ]; then
      tmux attach -t nixOS || tmux new -s nixOS
   fi

    '';
  }
