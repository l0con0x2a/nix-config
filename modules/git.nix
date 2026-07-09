{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = null;

    settings = {
      user.useConfigOnly = true;
    };
  };

  programs.zsh.shellAliases = {
    g = "git";
  };
}
