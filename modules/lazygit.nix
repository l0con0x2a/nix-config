{ config, pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
  };
}
