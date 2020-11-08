{ config, lib, ... }:

{
  home.keyboard = {
    enable = true;
    layout = "au";
    model = "thinkpad";

    options = [
      "ctrl:nocaps"
      "altwin:swap_alt_win"
    ];
  };
}
