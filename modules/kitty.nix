{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    themeFile = "Nightfox";

    settings = {
      confirm_os_window_close = 0;
    };
  };
}
