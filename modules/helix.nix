{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "nightfox";

      editor = {
        line-number = "relative";
      };
    };
  };
}
