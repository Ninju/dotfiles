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
        "${mod}+Shift+z" = "exec --no-startup-id morc_menu";

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

        "${mod}+Ctrl+1" = "move container to workspace 1";
        "${mod}+Ctrl+2" = "move container to workspace 2";
        "${mod}+Ctrl+3" = "move container to workspace 3";
        "${mod}+Ctrl+4" = "move container to workspace 4";
        "${mod}+Ctrl+5" = "move container to workspace 5";
        "${mod}+Ctrl+6" = "move container to workspace 6";
        "${mod}+Ctrl+7" = "move container to workspace 7";
        "${mod}+Ctrl+8" = "move container to workspace 8";
        "${mod}+Ctrl+9" = "move container to workspace 9";
        "${mod}+Ctrl+0" = "move container to workspace 10";

        # Move to workspace with focused container;
        "${mod}+Shift+1" = "move container to workspace $ws1; workspace $ws1";
        "${mod}+Shift+2" = "move container to workspace $ws2; workspace $ws2";
        "${mod}+Shift+3" = "move container to workspace $ws3; workspace $ws3";
        "${mod}+Shift+4" = "move container to workspace $ws4; workspace $ws4";
        "${mod}+Shift+5" = "move container to workspace $ws5; workspace $ws5";
        "${mod}+Shift+6" = "move container to workspace $ws6; workspace $ws6";
        "${mod}+Shift+7" = "move container to workspace $ws7; workspace $ws7";
        "${mod}+Shift+8" = "move container to workspace $ws8; workspace $ws8";
        "${mod}+Shift+9" = "move container to workspace $ws9; workspace $ws9";
        "${mod}+Shift+0" = "move container to workspace $ws0; workspace $ws0";

        # change borders
        "${mod}+u" = "border none";
        "${mod}+y" = "border pixel 1";
        "${mod}+n" = "border normal";

        # Lock screen
        # Managed via $mode_system $mod+l below
        # "${mod}+9" = "exec --no-startup-id blurlock";

        ################################################################################################
        ## sound-section - DO NOT EDIT if you wish to automatically upgrade Alsa -> Pulseaudio later! ##
        ################################################################################################

        "${mod}+Ctrl+m" = "exec terminal -e 'alsamixer'";
        #exec --no-startup-id pulseaudio;
        #exec --no-startup-id pa-applet;
        #bindsym $mod+Ctrl+m exec pavucontrol;

          # Screen brightness controls
          # bindsym XF86MonBrightnessUp exec "xbacklight -inc 10; notify-send 'brightness up'"
          # bindsym XF86MonBrightnessDown exec "xbacklight -dec 10; notify-send 'brightness down'"

          # Start Applications
          "${mod}+Ctrl+b" = "exec terminal -e 'bmenu'";
          "${mod}+F2" = "exec palemoon";
          "${mod}+F3" = "exec pcmanfm";
          # "${mod}+F3" = "exec ranger"
          "${mod}+Shift+F3" = "exec pcmanfm_pkexec";
          "${mod}+F5" = "exec terminal -e 'mocp'";
          "${mod}+t" = "exec --no-startup-id pkill compton";
          "${mod}+Ctrl+t" = "exec --no-startup-id compton -b";
          "${mod}+Print" = "--release exec --no-startup-id i3-scrot -w";
          "${mod}+Shift+Print" = "--release exec --no-startup-id i3-scrot -s";
          "${mod}+Shift+h" = "exec xdg-open /usr/share/doc/manjaro/i3_help.pdf";
          "${mod}+Ctrl+x" = "--release exec --no-startup-id xkill";

        # "${mod}+Shift+s = "move workspace to output left";
        "${mod}+Shift+s" = "exec i3-input -F 'move workspace to output \"%s\"' -P 'Output (up/down/left/right): '";
      };
    };

    extraConfig = ''
        bindsym Print exec --no-startup-id i3-scrot
        bindsym $mod+Shift+d --release exec "killall dunst; exec notify-send 'restart dunst'"

        # Configure border style <normal|1pixel|pixel xx|none|pixel>
        default_border pixel 1
        default_floating_border normal

        # Hide borders
        hide_edge_borders none

        # Font for window titles. Will also be used by the bar unless a different font
        # is used in the bar {} block below.
        font xft:URWGothic-Book 11

        # Use Mouse+$mod to drag floating windows
        floating_modifier $mod

        # Open specific applications in floating mode
        for_window [title="alsamixer"] floating enable border pixel 1
        for_window [class="calamares"] floating enable border normal
        for_window [class="Clipgrab"] floating enable
        for_window [title="File Transfer*"] floating enable
        for_window [class="fpakman"] floating enable
        for_window [class="Galculator"] floating enable border pixel 1
        for_window [class="GParted"] floating enable border normal
        for_window [title="i3_help"] floating enable sticky enable border normal
        for_window [class="Lightdm-settings"] floating enable
        for_window [class="Lxappearance"] floating enable sticky enable border normal
        for_window [class="Manjaro-hello"] floating enable
        for_window [class="Manjaro Settings Manager"] floating enable border normal
        for_window [title="MuseScore: Play Panel"] floating enable
        for_window [class="Nitrogen"] floating enable sticky enable border normal
        for_window [class="Oblogout"] fullscreen enable
        for_window [class="octopi"] floating enable
        for_window [title="About Pale Moon"] floating enable
        for_window [class="Pamac-manager"] floating enable
        for_window [class="Pavucontrol"] floating enable
        for_window [class="qt5ct"] floating enable sticky enable border normal
        for_window [class="Qtconfig-qt4"] floating enable sticky enable border normal
        for_window [class="Simple-scan"] floating enable border normal
        for_window [class="(?i)System-config-printer.py"] floating enable border normal
        for_window [class="Skype"] floating enable border normal
        for_window [class="Timeset-gui"] floating enable border normal
        for_window [class="(?i)virtualbox"] floating enable border normal
        for_window [class="Xfburn"] floating enable

        bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

        bindsym $mod+l mode "$mode_system"
        set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
        mode "$mode_system" {
            bindsym l exec --no-startup-id i3exit lock, mode "default"
            bindsym s exec --no-startup-id i3exit suspend, mode "default"
            bindsym u exec --no-startup-id i3exit switch_user, mode "default"
            bindsym e exec --no-startup-id i3exit logout, mode "default"
            bindsym h exec --no-startup-id i3exit hibernate, mode "default"
            bindsym r exec --no-startup-id i3exit reboot, mode "default"
            bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"

            # exit system mode: "Enter" or "Escape"
            bindsym Return mode "default"
            bindsym Escape mode "default"
        }

        exec --no-startup-id volumeicon

        # switch to workspace with urgent window automatically
        for_window [urgent=latest] focus

        # Resize window (you can also use the mouse for that)
        bindsym $mod+r mode "resize"
        mode "resize" {
                # These bindings trigger as soon as you enter the resize mode
                # Pressing left will shrink the window’s width.
                # Pressing right will grow the window’s width.
                # Pressing up will shrink the window’s height.
                # Pressing down will grow the window’s height.
                bindsym j resize shrink width 5 px or 5 ppt
                bindsym k resize grow height 5 px or 5 ppt
                bindsym l resize shrink height 5 px or 5 ppt
                bindsym semicolon resize grow width 5 px or 5 ppt

                # same bindings, but for the arrow keys
                bindsym Left resize shrink width 10 px or 10 ppt
                bindsym Down resize grow height 10 px or 10 ppt
                bindsym Up resize shrink height 10 px or 10 ppt
                bindsym Right resize grow width 10 px or 10 ppt

                # exit resize mode: Enter or Escape
                bindsym Return mode "default"
                bindsym Escape mode "default"
        }

        # Autostart applications
        exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
        exec --no-startup-id nitrogen --restore; sleep 1; compton -b
        exec --no-startup-id manjaro-hello
        exec --no-startup-id nm-applet
        exec --no-startup-id xfce4-power-manager
        exec --no-startup-id pamac-tray
        exec --no-startup-id clipit
        # exec --no-startup-id blueman-applet
        # exec_always --no-startup-id sbxkb
        exec --no-startup-id start_conky_maia
        # exec --no-startup-id start_conky_green
        exec --no-startup-id xautolock -time 10 -locker blurlock
        exec_always --no-startup-id ff-theme-util
        exec_always --no-startup-id fix_xcursor

        # Color palette used for the terminal ( ~/.Xresources file )
        # Colors are gathered based on the documentation:
        # https://i3wm.org/docs/userguide.html#xresources
        # Change the variable name at the place you want to match the color
        # of your terminal like this:
        # [example]
        # If you want your bar to have the same background color as your
        # terminal background change the line 362 from:
        # background #14191D
        # to:
        # background $term_background
        # Same logic applied to everything else.
        set_from_resource $term_background background
        set_from_resource $term_foreground foreground
        set_from_resource $term_color0     color0
        set_from_resource $term_color1     color1
        set_from_resource $term_color2     color2
        set_from_resource $term_color3     color3
        set_from_resource $term_color4     color4
        set_from_resource $term_color5     color5
        set_from_resource $term_color6     color6
        set_from_resource $term_color7     color7
        set_from_resource $term_color8     color8
        set_from_resource $term_color9     color9
        set_from_resource $term_color10    color10
        set_from_resource $term_color11    color11
        set_from_resource $term_color12    color12
        set_from_resource $term_color13    color13
        set_from_resource $term_color14    color14
        set_from_resource $term_color15    color15

        # Start i3bar to display a workspace bar (plus the system information i3status if available)
        bar {
          i3bar_command i3bar
          status_command i3status
          position bottom

        ## please set your primary output first. Example: 'xrandr --output eDP1 --primary'
        #	tray_output primary
        #	tray_output eDP1

          bindsym button4 nop
          bindsym button5 nop
        #   font xft:URWGothic-Book 11
          strip_workspace_numbers yes

            colors {
                background #222D31
                statusline #F9FAF9
                separator  #454947

        #                      border  backgr. text
                focused_workspace  #F9FAF9 #16a085 #292F34
                active_workspace   #595B5B #353836 #FDF6E3
                inactive_workspace #595B5B #222D31 #EEE8D5
                binding_mode       #16a085 #2C2C2C #F9FAF9
                urgent_workspace   #16a085 #FDF6E3 #E5201D
            }
        }

        # hide/unhide i3status bar
        bindsym $mod+m bar mode toggle

        # Theme colors
        # class                   border  backgr. text    indic.   child_border
          client.focused          #556064 #556064 #80FFF9 #FDF6E3
          client.focused_inactive #2F3D44 #2F3D44 #1ABC9C #454948
          client.unfocused        #2F3D44 #2F3D44 #1ABC9C #454948
          client.urgent           #CB4B16 #FDF6E3 #1ABC9C #268BD2
          client.placeholder      #000000 #0c0c0c #ffffff #000000

          client.background       #2B2C2B

        #############################
        ### settings for i3-gaps: ###
        #############################

        # Set inner/outer gaps
        gaps inner 14
        gaps outer -2

        # Additionally, you can issue commands with the following syntax. This is useful to bind keys to changing the gap size.
        # gaps inner|outer current|all set|plus|minus <px>
        # gaps inner all set 10
        # gaps outer all plus 5

        # Smart gaps (gaps used if only more than one container on the workspace)
        smart_gaps on

        # Smart borders (draw borders around container only if it is not the only container on this workspace)
        # on|no_gaps (on=always activate and no_gaps=only activate if the gap size to the edge of the screen is 0)
        smart_borders on

        # Press $mod+Shift+g to enter the gap mode. Choose o or i for modifying outer/inner gaps. Press one of + / - (in-/decrement for current workspace) or 0 (remove gaps for current workspace). If you also press Shift with these keys, the change will be global for all workspaces.
        set $mode_gaps Gaps: (o) outer, (i) inner
        set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
        set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
        bindsym $mod+Shift+g mode "$mode_gaps"

        mode "$mode_gaps" {
                bindsym o      mode "$mode_gaps_outer"
                bindsym i      mode "$mode_gaps_inner"
                bindsym Return mode "default"
                bindsym Escape mode "default"
        }
        mode "$mode_gaps_inner" {
                bindsym plus  gaps inner current plus 5
                bindsym minus gaps inner current minus 5
                bindsym 0     gaps inner current set 0

                bindsym Shift+plus  gaps inner all plus 5
                bindsym Shift+minus gaps inner all minus 5
                bindsym Shift+0     gaps inner all set 0

                bindsym Return mode "default"
                bindsym Escape mode "default"
        }
        mode "$mode_gaps_outer" {
                bindsym plus  gaps outer current plus 5
                bindsym minus gaps outer current minus 5
                bindsym 0     gaps outer current set 0

                bindsym Shift+plus  gaps outer all plus 5
                bindsym Shift+minus gaps outer all minus 5
                bindsym Shift+0     gaps outer all set 0

                bindsym Return mode "default"
                bindsym Escape mode "default"
        }

        '';
  };

}
