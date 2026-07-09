{ config, pkgs, ... }:

{
  programs.ripgrep = {
    enable = true;
    package = null;
  };

  programs.zsh.shellAliases = {
    r = "rg";
  };
}
