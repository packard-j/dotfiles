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
