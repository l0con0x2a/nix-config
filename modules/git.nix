{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.useConfigOnly = true;
    };
  };

  programs.zsh.shellAliases = {
    g = "git";
  };
}
