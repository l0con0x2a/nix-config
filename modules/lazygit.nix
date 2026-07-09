{ config, pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    package = null;
    enableZshIntegration = true;
  };
}
