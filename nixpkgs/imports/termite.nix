{ config, pkgs, ... }:

{
  # home.file.".config/termite/config".source = ../pre-migration/termite/config;

  programs.termite = {
    enable = true;
    allowBold = true;
    audibleBell = false;
    clickableUrl = true;
    dynamicTitle = true;
    mouseAutohide = true;
    font = "Monospace 12";
    scrollbackLines = 10000;
    browser = "${pkgs.xdg_utils}/xdg-open";
    cursorShape = "block";
    colorsExtra = ''
      # Solarized light color scheme

# REMOVETAG       foreground = #657b83
# REMOVETAG       foreground_bold = #073642
# REMOVETAG     #foreground_dim = #888887
# REMOVETAG       background = #fdf6e3
# REMOVETAG       cursor = #586e75

# REMOVETAG     #  if unset, will reverse foreground and background
# REMOVETAG     ##highlight = #839496

# REMOVETAG   # colors from color0 to color254 can be set
# REMOVETAG   color0 = #073642
# REMOVETAG   color1 = #dc322f
# REMOVETAG   color2 = #859900
# REMOVETAG   color3 = #b58900
# REMOVETAG   color4 = #268bd2
# REMOVETAG   color5 = #d33682
# REMOVETAG   color6 = #2aa198
# REMOVETAG   color7 = #eee8d5
# REMOVETAG   color8 = #002b36
# REMOVETAG   color9 = #cb4b16
# REMOVETAG   color10 = #586e75
# REMOVETAG   color11 = #657b83
# REMOVETAG   color12 = #839496
# REMOVETAG   color13 = #6c71c4
# REMOVETAG   color14 = #93a1a1
# REMOVETAG   color14 = #fdf6e3
    '';
  };
}
