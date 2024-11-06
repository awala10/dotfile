pkgs: with pkgs; [
  screen
  ctags
  (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
]
