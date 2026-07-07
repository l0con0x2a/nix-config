{ config, pkgs, ... }:

{
  programs.ripgrep = {
    enable = true;
  };

  programs.zsh.shellAliases = {
    r = "rg";
  };
}
