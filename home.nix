{ config, pkgs, ... }:
  let
    unstable = import <nixos-unstable> {};
    bashsettings = import ./bash.nix;
    packages =  import ./packages.nix pkgs;
    git = import ./git.nix;
  in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kawala";
  home.homeDirectory = "/home/kawala";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = packages;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
 # imports = [
 #   ./bash.nix
 # ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kawala/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.neovim= {
    enable = true;
    #package =  unstable.vim;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nftables
      gruvbox-material
      align
      dracula-vim
      undotree
      vim-sensible
      vim-nix
      vim-airline
      vim-surround
      vim-lastplace
      vim-gitgutter
      vim-better-whitespace
      vim-yaml
      vim-fugitive
      vim-terraform
      vim-tmux-navigator
      vim-gitgutter
  #   YouCompleteMe
  #   vim-one
     ];
  extraConfig = builtins.readFile ./vimrc;
  };
  programs.bash = bashsettings pkgs;
  programs.tmux = {
    enable = true;
    shortcut = "space";
    clock24= true;
    historyLimit = 1000;
    keyMode = "vi";
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      dracula
      vim-tmux-navigator
      cpu
    ];
   # extracConfig = builtins.readFile ./tmux.conf;
   extraConfig = ''
    set -g default-shell $SHELL
  # Mouse
    set -g mouse on
  # History
  # set -g history-limit 102400
  # Set windows and page index to base 1
  # set -g base-index 1
    setw -g pane-base-index 1
  # Re-number windows when creating/closing new windows
    set -g renumber-windows on
  # Use emacs key bindings in status line
    set-option -g status-keys emacs
  # Use vim key bindings in copy mode
  # setw -g mode-keys vi
  # Fix ESC delay in vim
    set -g escape-time 10
   # ------------#
   # Keybindings #
   # ------------#
   # Set prefix to C-a
   # unbind C-b
  #  set -g prefix C-space
   # Copy-mode
     unbind-key -T copy-mode-vi v
     bind-key -T copy-mode-vi v send-keys -X begin-selection
     bind-key -T copy-mode-vi 'C-v' send-keys -X rectangle-toggle
     bind-key -T copy-mode-vi y send-keys -X copy-pipe "pbcopy"
     bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
     bind-key -T copy-mode-vi Escape send-keys -X cancel
   # Send command on double press
     bind C-a send-prefix
     bind C-l send-keys 'C-l'
   # Reload tmux.conf on prefix r
   # bind r source-file ~/.tmux.conf \; display "Config reloaded!"
   # Split panes and remember current path
     bind '|' split-window -h -c '#{pane_current_path}'
     bind - split-window -v -c '#{pane_current_path}'
     # Remember current path when creating new windows
     bind c new-window -c '#{pane_current_path}'
     # Break pane into new window and keep focus on the current window
     bind b break-pane -d
     '';
  };
  programs.git  = git pkgs;

}
