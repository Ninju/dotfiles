{ config, pkgs, ... }:

let
  edp1_edid = "00ffffffffffff0006af3d3100000000001a0104a51f1178028d15a156529d280a505400000001010101010101010101010101010101143780b87038244010103e0035ae100000180000000f0000000000000000000000000020000000fe0041554f0a202020202020202020000000fe004231343048414e30332e31200a003b";

  dp2_edid = "00ffffffffffff0030aeae6101010101281b0104a5351e7818ffd5a95345a0250d5054a1080081809500a9c0b300d1c0d10001010101565e00a0a0a02950302035000f282100001a000000ff0055345030303030310a20202020000000fd00314c1e701e000a202020202020000000fc00503234682d31300a2020202020015f02031cf04901020304051413101f23090707830100006547e0000400011d007251d01e206e2855000f282100001f8c0ad08a20e02d10103e96000f282100001900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020";

  hdmi1_edid = "00ffffffffffff0030aeae6101010101281b0103a0351e782affd5a95345a0250d5054a1080081809500a9c0b300d1c0d10001010101565e00a0a0a02950302035000f282100001a023a801871382d40582c45000f282100001e000000fd00314c1e701e000a202020202020000000fc00503234682d31300a2020202020017d02031ef04b01020304051413101f1112230907078301000065030c002000011d007251d01e206e2855000f282100001f8c0ad08a20e02d10103e96000f282100001900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f5";

  eDP-1-config = {
    enable = true;
    mode = "1920x1080";
    position = "460x1440";
    primary = true;
  };

  DP-2-config = {
    enable = true;
    mode = "2560x1440";
    position = "0x0";
    rate = "60.00";
  };

  HDMI-1-config = {
    enable = true;
    mode = "2560x1440";
    position = "2560x0";
    rotate = "right";
  };

  fingerprint = {
    eDP-1 = edp1_edid;
    DP-2 = dp2_edid;
    HDMI-1 = hdmi1_edid;
  };

  config = {
    eDP-1 = eDP-1-config;
    DP-2 = DP-2-config;
    HDMI-1 = HDMI-1-config;
  };
in

{
  programs.autorandr = {
    enable = true;

    profiles = {
      "all-three" = {
        inherit config;
        inherit fingerprint;
      };

      "laptop-only" = {
        fingerprint = {
          inherit (fingerprint) eDP-1;
        };

        config = {
          inherit (config) eDP-1;
        };
      };

      "external-only" = {
        fingerprint = { inherit (fingerprint) eDP-1 DP-2; };
        config = {
          inherit (config) DP-2;
          eDP-1 = config.eDP-1 // { enable = false; };
        };
      };

      "laptop-under-external" = {
        fingerprint = {
          eDP-1 = edp1_edid;
          DP-2 = dp2_edid;
        };

        config = {
          inherit (config) eDP-1 DP-2;
        };
      };
    };
  };
}
