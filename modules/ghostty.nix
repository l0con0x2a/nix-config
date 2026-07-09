{ config, pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;
    # macOS では Homebrew cask の Zed を使うので、Home Manager では本体を入れない
    package = if pkgs.stdenv.isDarwin then null else pkgs.zed-editor;
  };
}
