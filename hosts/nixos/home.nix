{ host, ... }:

{
  imports = [
    ../../modules/bat.nix
    ../../modules/btop.nix
    ../../modules/codex.nix
    ../../modules/eza.nix
    ../../modules/firefox.nix
    ../../modules/fzf.nix
    ../../modules/gh.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/hyprland.nix
    ../../modules/kitty.nix
    ../../modules/lazygit.nix
    ../../modules/ripgrep.nix
    ../../modules/starship.nix
    ../../modules/yazi.nix
    ../../modules/zed-editor.nix
    ../../modules/zsh.nix
  ];

  home.username = host.user.name;
  home.homeDirectory = host.user.homeDirectory;
}
