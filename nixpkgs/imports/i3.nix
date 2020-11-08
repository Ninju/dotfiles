{ config, pkgs, ... }:

let
  rofi-bin = "${pkgs.rofi}/bin/rofi";
in
{
  home.packages = with pkgs; [
    i3status
    rofi
  ];

  xsession.windowManager.i3 = rec {
    enable = true;

    config = {
      modifier = "Mod4";

      bars = [
        {
          statusCommand = "${pkgs.i3status}/bin/i3status";
          mode = "hide";
        }
      ];

      keybindings = let mod = config.modifier; in {
        "${mod}+Tab" = "workspace back_and_forth";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";

        "${mod}+Return" = "exec i3-sensible-terminal";
        "${mod}+Shift+q" = "kill";

        "${mod}+i" = "exec i3-input";

        "${mod}+d" = "exec ${rofi-bin} -show run";
        "${mod}+Shift+d" = "exec ${rofi-bin} -show window";

        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";

        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+h" = "split h";
        "${mod}+v" = "split v";

        "${mod}+f" = "fullscreen toggle";

        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+Shift+space" = "floating toggle";

        "${mod}+space" = "focus mode_toggle";

        "${mod}+a" = "focus parent";

        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";

        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 10";

        # "${mod}+Shift+s = "move workspace to output left";
        "${mod}+Shift+s" = "exec i3-input -F 'move workspace to output \"%s\"' -P 'Output (up/down/left/right): '";
      };
    };

    extraConfig = ''
        for_window [class=".*"] border pixel 2
        gaps inner 4

        client.focused          #4c7899 #285577 #ffffff #2e9ef4   #ffff00
        client.focused_inactive #333333 #5f676a #ffffff #484e50   #5f676a
        client.unfocused        #333333 #222222 #888888 #292d2e   #222222
        client.urgent           #2f343a #900000 #ffffff #900000   #900000
        client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c

        client.background       #ffffff
        '';
  };

}
