{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh.shellAliases = {
    l = "eza --icons=auto --group-directories-first";
    ll = "eza -la --icons=auto --group-directories-first --git";
    lt = "eza --tree --icons=auto --group-directories-first";
  };
}
