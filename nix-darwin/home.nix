{ pkgs, ... }:
{
  home.packages =
    let
      hPkgs = pkgs.haskell.packages."ghc98";
    in
    with pkgs;
    [
      git
      # Editor
      neovim
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
      # Nix Development
      nil
      nixfmt-rfc-style
      # Lua Development
      lua-language-server
      # Shell
      nix-your-shell
    ];
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "af-magic";
    };
    shellAliases = {
      rebuild = "darwin-rebuild switch --flake ~/.config/nix-darwin";
    };
    # Nix-your-shell
    initExtra = ''
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
