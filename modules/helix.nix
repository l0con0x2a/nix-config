{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    package = null;

    settings = {
      theme = "nightfox";

      editor = {
        line-number = "relative";
      };
    };
  };
}
