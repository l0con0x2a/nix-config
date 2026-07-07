{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
  };

  programs.zsh.shellAliases = {
    b = "bat";
  };
}
