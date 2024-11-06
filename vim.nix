pkgs:

{
  enable = true;
  plugins = with pkgs.vimPlugins; [
    vim-nftables
    gruvbox-material
    dracula-vim
    align
    vim-sensible
    vim-nix
    vim-airline
    vim-surround
    vim-lastplace
    vim-gitgutter
    vim-better-whitespace
    vim-yaml
    vim-fugitive
    nord-vim
    solarized
    vim-terraform
    vim-tmux-navigator
    vim-gitgutter
#   YouCompleteMe
    # vim-one
  ];

  extraConfig = builtins.readFile ./vimrc;
  }
