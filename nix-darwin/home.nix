{ pkgs, ... }: {
  home.packages = let hPkgs = pkgs.haskell.packages."ghc948";
  in with pkgs; [
    # Editor
    neovim
    # Security
    gnupg
    pass
    # Haskell Development
    hPkgs.ghc
    hPkgs.cabal-install
    hPkgs.hoogle
    hPkgs.stack
    hPkgs.haskell-language-server
    hPkgs.ghcid
    hPkgs.ormolu
    hPkgs.implicit-hie
    # TypeScript Development
    nodejs_20
    nodePackages.typescript-language-server
    # Nix Development
    nil
    nixfmt
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
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
