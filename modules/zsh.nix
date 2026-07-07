{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghq
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${config.home.homeDirectory}/.zsh";

    autocd = true;
    defaultKeymap = "emacs";

    enableCompletion = true;
    completionInit = ''
      autoload -Uz compinit
      compinit -d "''${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-''${ZSH_VERSION}"
    '';

    history = {
      path = "${config.xdg.stateHome}/zsh/history";
      size = 50000;
      save = 50000;
      extended = true;
      share = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
    };

    sessionVariables = {
      EDITOR = "hx";
    } // lib.optionalAttrs pkgs.stdenv.isDarwin {
      SHELL_SESSIONS_DISABLE = "1";
    };

    initExtraBeforeCompInit = lib.optionalString pkgs.stdenv.isDarwin ''
      if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';

    initContent = ''
      setopt HIST_REDUCE_BLANKS
      setopt HIST_VERIFY

      setopt AUTO_PUSHD
      setopt PUSHD_IGNORE_DUPS
      setopt PUSHD_SILENT
      setopt INTERACTIVE_COMMENTS

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      zstyle ':completion:*' menu select

      if [[ -n "$LS_COLORS" ]]; then
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      fi

      bindkey '^[[A' history-beginning-search-backward
      bindkey '^[[B' history-beginning-search-forward

      cdghq() {
        local repo

        repo="$(ghq list --full-path | fzf -1)" || return
        [[ -n "$repo" ]] && cd "$repo"
      }

      [[ -r "''${XDG_CONFIG_HOME:-$HOME/.config}/zsh/local.zsh" ]] \
        && source "''${XDG_CONFIG_HOME:-$HOME/.config}/zsh/local.zsh"
    '';
  };
}
