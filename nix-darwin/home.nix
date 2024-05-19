{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Editor
    neovim
    # Security
    gnupg
    pass
    # Haskell Development
    haskellPackages.cabal-install
    haskellPackages.hoogle
    haskellPackages.stack
    # TypeScript Development
    nodejs_20
    nodePackages.typescript-language-server
    # Nix Development
    nil
    # Lua Development
    lua-language-server
    # Shell
    nix-your-shell
  ];
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "af-magic";
    };
    # Shell aliases don't seem to be working right now
    shellAliases = {
      rebuild = "darwin-rebuild switch --flake ~/.config/nix-darwin";
    };
  };
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
