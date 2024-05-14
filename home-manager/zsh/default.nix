{ hostname
, config
, pkgs
, lib
, ...
}:
with lib;
  let 
    cfg = config.modules.zsh;
in {
  options.modules.zsh = { enable = mkEnableOption "zsh";};
  config = mkIf cfg.enable {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
 #   prezto.enable = true;
 #   prezto.tmux.autoStartRemote = true;
    initExtra = ''
    '';
    oh-my-zsh = {
      enable = true;
      plugins = with pkgs; [ "tmux" ];

    };
    shellAliases = {
      ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      v = "nvim";
      ls = "eza --icons --long";
      # nixos
      hm = "cd ~/.config/home-manager/ && v";
      notes = "cd ~/notes/ && v";
      music = "ncspot";
    };
  };
  };
}