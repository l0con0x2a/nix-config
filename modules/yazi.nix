{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    # TODO: write config
  };

  programs.zsh.shellAliases = {
    y = "yazi";
  };
}
