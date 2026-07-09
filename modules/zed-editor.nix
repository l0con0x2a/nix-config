{ config, pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;
    # macOS では Homebrew cask の Zed を使うので、Home Manager では本体を入れない
    package = if pkgs.stdenv.isDarwin then null else pkgs.zed-editor;

    extensions = [ "nix" "toml" "rust" ];

    userSettings = {
      theme = "One Light";
      auto_update = false;
      base_keymap = "VSCode";
      vim_mode = true;

      # Tell Zed to use direnv and direnv can use a flake.nix environment
      load_direnv = "shell_hook";

      show_whitespaces = "all";
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
