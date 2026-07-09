{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    package = null;

    # TODO: write config
  };

  programs.zsh.shellAliases = {
    y = "yazi";
  };
}
