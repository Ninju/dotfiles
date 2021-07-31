{ config, lib, ... }:

{
  home.keyboard = {
    enable = true;
    layout = "au,gb";
    model = "pc105";

    options = [
      "ctrl:nocaps"
      "altwin:swap_alt_win"
      "grp:alt_shift_toggle"
    ];
  };
}
