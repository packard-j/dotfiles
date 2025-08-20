{ pkgs, ... }:
{
  home.packages =
    let
      hPkgs = pkgs.haskell.packages."ghc98";
      kubernetes-helm-wrapped = with pkgs; wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-git
        ];
      };
    in
    with pkgs;
    [
      git
      # Editor
      neovim
      ripgrep
      # Security
      gnupg
      pass
      # Haskell Development
      stack
      hPkgs.ghc
      hPkgs.cabal-install
      hPkgs.hoogle
      hPkgs.haskell-language-server
      hPkgs.ghcid
      hPkgs.ormolu
      hPkgs.implicit-hie
      # Racket Development
      racket-minimal
      # TypeScript Development
      nodejs_22
      nodePackages.typescript-language-server
      # Go Development
      go
      gopls
      # Nix Development
      nil
      nixfmt-rfc-style
      # Lua Development
      lua-language-server
      # Shell
      nix-your-shell
      # Kubernetes
      kubectl
      minikube
      kubernetes-helm-wrapped
      helmfile-wrapped
    ];
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "kubectl" ];
      theme = "af-magic";
    };
    shellAliases = {
      rebuild = "~/.config/system/rebuild.sh";
    };
    # Nix-your-shell
    initContent = ''
      nix-your-shell zsh | source /dev/stdin
    '';
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
