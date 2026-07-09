{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = null;

    themeFile = "Nightfox";

    settings = {
      confirm_os_window_close = 0;
    };
  };
}
