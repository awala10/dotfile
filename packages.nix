pkgs: with pkgs; [
  screen
  ctags
  nixpkgs-fmt
  (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
]
